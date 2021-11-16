using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
public class ColorMe : MonoBehaviour , IPointerEnterHandler , IPointerExitHandler
{
    private bool epilepsy = false;
    public void OnPointerEnter(PointerEventData eventData)
    {
        epilepsy = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        epilepsy = false;
    }


    // Update is called once per frame
    void Update()
    {
        if (epilepsy)
        {
            GetComponent<Image>().color = new Color(Random.Range(0f, 1f), Random.Range(0f, 1f), Random.Range(0f, 1f));
        }
    }
}
