using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BALL : MonoBehaviour
{
    [SerializeField]
    public BallResource resource;
    private int hitsFor;
    private string ballName;
    private string ballDescription;

    // Start is called before the first frame update
    void Start()
    {
        this.hitsFor = resource.hitsFor;
        this.ballName = resource.name;
        this.ballDescription = resource.description;
        gameObject.transform.localScale = resource.scale;
        gameObject.GetComponent<SpriteRenderer>().material = resource.material;
        gameObject.GetComponent<CircleCollider2D>().sharedMaterial = resource.physicMaterial;
        resource.particlePreset.ApplyTo(gameObject.GetComponent<ParticleSystem>());
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void OnCollisionEnter2D(Collision2D col)
    {
        col.gameObject.GetComponent<ParticleSystem>().Play();
    }
}
