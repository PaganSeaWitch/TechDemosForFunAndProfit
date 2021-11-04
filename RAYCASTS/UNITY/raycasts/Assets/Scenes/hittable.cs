using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class Hittable : MonoBehaviour
{

    public virtual void Hit(HitType hit) { Debug.Log("HIT by " + hit.getHitType() + " with a force of " + hit.getForce());}
}
