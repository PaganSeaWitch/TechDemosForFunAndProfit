using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Click : MonoBehaviour
{
    public Camera camera;
    void Update()
    {
        if (Input.GetButtonDown("Fire1")){
            RaycastHit hit;
            Ray ray = camera.ScreenPointToRay(Input.mousePosition);

            if (Physics.Raycast(ray, out hit))
            {
                Debug.Log("hit something!");
                Transform objectHit = hit.transform;
                Hittable hittable = objectHit.GetComponentInChildren<Hittable>();
                if(hittable != null)
                {
                    PlayerHit hittype = new PlayerHit();
                    hittype.setForce(1);
                    hittable.Hit(hittype);
                }
            }
        }
    }
}
