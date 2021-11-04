using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBack : Hittable
{
    public override void Hit(HitType hit) 
    {
        base.Hit(hit);
        if(hit is HitType){
            this.transform.position = new Vector3(this.transform.position.x, this.transform.position.y + hit.getForce(), this.transform.position.z);

        }
    }
}
