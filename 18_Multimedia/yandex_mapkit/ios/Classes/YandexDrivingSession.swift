import Foundation
import YandexMapsMobile

public class YandexDrivingSession: NSObject {
  private var id: Int
  private var session: YMKDrivingSession
  private let methodChannel: FlutterMethodChannel!
  private var onClose: (Int) -> ()

  public required init(
    id: Int,
    session: YMKDrivingSession,
    registrar: FlutterPluginRegistrar,
    onClose: @escaping ((Int) -> ())
  ) {
    self.id = id
    self.session = session
    self.onClose = onClose

    methodChannel = FlutterMethodChannel(
      name: "yandex_mapkit/yandex_driving_session_\(id)",
      binaryMessenger: registrar.messenger()
    )

    super.init()

    weak var weakSelf = self
    self.methodChannel.setMethodCallHandler({ weakSelf?.handle($0, result: $1) })
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "cancel":
      cancel()
      result(nil)
    case "retry":
      retry(result)
    case "close":
      close()
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func cancel() {
    session.cancel()
  }

  public func retry(_ result: @escaping FlutterResult) {
    session.retry(routeHandler: {(drivingResponse: [YMKDrivingRoute]?, error: Error?) -> Void in
      self.handleResponse(drivingResponse: drivingResponse, error: error, result: result)
    })
  }

  public func close() {
    session.cancel()

    onClose(id)
  }

  public func handleResponse(drivingResponse: [YMKDrivingRoute]?, error: Error?, result: @escaping FlutterResult) {
    if let response = drivingResponse {
      onSuccess(response, result)
    } else {
      onError(error!, result)
    }
  }

  private func onSuccess(_ res: [YMKDrivingRoute], _ result: @escaping FlutterResult) {
    let routes = res.map { (route) -> [String: Any] in
      let weight = route.metadata.weight

      return [
        "polyline": Utils.polylineToJson(route.geometry),
        "metadata": [
          "weight": [
            "time": Utils.localizedValueToJson(weight.time),
            "timeWithTraffic": Utils.localizedValueToJson(weight.timeWithTraffic),
            "distance": Utils.localizedValueToJson(weight.distance)
          ]
        ]
      ]
    }

    let arguments: [String: Any] = [
      "routes": routes
    ]

    result(arguments)
  }

  private func onError(_ error: Error, _ result: @escaping FlutterResult) {
    result(Utils.errorToJson(error))
  }
}
