package com.dev.ace.animatedsplashscreen

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.dev.ace.animatedsplashscreen.databinding.ActivityMainBinding


class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)


        binding.treeAnim.setAnimation(R.raw.santa_pop_up)
        binding.treeAnim.animate().startDelay = 3000
        binding.treeAnim.playAnimation()
    }
}