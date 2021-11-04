using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class HitType
{
    private int force;
    public void setForce(int newForce){ force = newForce;}
    public virtual string getHitType() { return "generic";}
    public int getForce(){return force;}
}
