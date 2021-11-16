using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
public class dragMe : MonoBehaviour, IDragHandler, IBeginDragHandler, IEndDragHandler
{
    public RectTransform m_DraggingPlane;
    public void OnBeginDrag(PointerEventData eventData)
    {
        var canvas = FindInParents<Canvas>(gameObject);
        if (canvas == null)
            return;



      



        m_DraggingPlane = transform as RectTransform;

        Debug.Log("started drag");
        SetDraggedPosition(eventData);
    }

    public void OnDrag(PointerEventData data)
    {
            SetDraggedPosition(data);
    }

    private void SetDraggedPosition(PointerEventData data)
    {
       
        m_DraggingPlane = data.pointerEnter.transform as RectTransform;

        
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        Debug.Log("ended drag");
    }

    static public T FindInParents<T>(GameObject go) where T : Component
    {
        if (go == null) return null;
        var comp = go.GetComponent<T>();

        if (comp != null)
            return comp;

        Transform t = go.transform.parent;
        while (t != null && comp == null)
        {
            comp = t.gameObject.GetComponent<T>();
            t = t.parent;
        }
        return comp;
    }
}
