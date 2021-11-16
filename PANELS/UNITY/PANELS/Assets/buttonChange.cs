using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class buttonChange : MonoBehaviour
{
    [SerializeField]
    public GameObject eplisepy;

    [SerializeField]
    public GameObject scroll;

    [SerializeField]
    public GameObject drag;

    [SerializeField]
    public GameObject boxes;
    public void SwitchPanel(string type)
    {
        

        foreach (Transform child in gameObject.transform)
        {
            GameObject.Destroy(child.gameObject);
        }

        if (type == "epilepsy")
        {
            GameObject obj = Instantiate(eplisepy, gameObject.transform.position, Quaternion.identity, gameObject.transform);

        }
        if(type == "scroll")
        {
            GameObject obj = Instantiate(scroll, gameObject.transform.position, Quaternion.identity, gameObject.transform);

        }
        if (type == "drag")
        {
            GameObject obj = Instantiate(drag, gameObject.transform.position, Quaternion.identity, gameObject.transform);

        }
        if (type == "boxes")
        {
            GameObject obj = Instantiate(boxes, gameObject.transform.position, Quaternion.identity, gameObject.transform);

        }
    }
}
