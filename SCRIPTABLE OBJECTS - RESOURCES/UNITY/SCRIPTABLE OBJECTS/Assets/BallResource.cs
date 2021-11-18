using System.Collections;
using System.Collections.Generic;
using UnityEditor.Presets;
using UnityEngine;

[CreateAssetMenu(fileName = "BallResource", menuName = "ScriptableObjects/BallResource", order = 1)]
public class BallResource : ScriptableObject
{
    [SerializeField]
    public int hitsFor;
    [SerializeField]
    public Vector3 scale;
    [SerializeField]
    public int gravity_scale;
    [SerializeField]
    public PhysicsMaterial2D physicMaterial;
    [SerializeField]
    public Dictionary<string, int> payload;
    [SerializeField]
    public string ballName;
    [SerializeField]
    public string description;
    [SerializeField]
    public Material material;
    [SerializeField]
    public Preset particlePreset;
}
