using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBack : Hittable
{
    public override void Hit() 
    {
        base.Hit();
        this.transform.position = new Vector3(this.transform.position.x, this.transform.position.y +1, this.transform.position.z);
    }
}
