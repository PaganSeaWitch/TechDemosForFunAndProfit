using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBackAndUp : MoveBack
{
    public override void Hit(HitType hit)
    {
        base.Hit(hit);
        if(hit is PlayerHit){
            transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + hit.getForce());
        }
    }
}
