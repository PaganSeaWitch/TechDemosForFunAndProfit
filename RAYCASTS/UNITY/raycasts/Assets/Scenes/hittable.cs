using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class Hittable : MonoBehaviour
{

    public virtual void Hit() { Debug.Log("HIT!" + gameObject.GetInstanceID());}
}
