using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBackAndUp : MoveBack
{
    public override void Hit()
    {
        base.Hit();
        transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + 1);
    }
}
