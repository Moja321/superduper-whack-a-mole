﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DontDestroyObjectOnLoad : MonoBehaviour
{

    private void OnEnable()
    {
        DontDestroyOnLoad(this.gameObject);

    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
