using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkyBoxDayProc : MonoBehaviour
{
    public Material MyMat;      //스카이 박스 2개( 밤과 낮 )를 등록하고 블랜딩하는 쉐이더를 가진 머티리얼.
    public float StartTime;         //시작되는 시간.
    float DayTime;                  //현재 시간.
    public float NightStartTime;    //밤이 시작되는 시간.
    public float DayStartTime;      //낮이 시작되는 시간.
    public float SunSetTimeMax;  //일출과 일몰 시간. ( 블랜딩을 유지하는 총 시간 )
    public float TimeSpeed;         //시간이 흘러가는 속도.
    float SunSetTime;                 //일출과 일몰 진행 시간
    public GameObject SunObj;   //다이렉트 라이트

    //SkyBox 2개를 이용하여 구현된 밤낮.
    //2개의 SkyBox를 장착할 수 있는 Shader 가  둘의 값을 썬셋 근처에서 블랜딩하는 구조로 구현되었다. 
    //하루 24시간으로 책정.
    //저녁 시작 시간은 NightStartTime으로 아침 시작 시간은 DayStartTime으로 지정하면 된다.
    //이때, 2개의 스카이 박스가 블랜딩 될 시간은 SunSetTimeMax로 설정한다.
    
    //새로운 빈 오브젝트를 생성하고 이 스크립트를 붙이고 각 오브젝트를 등록한다.
    //타겟 머티리얼은 2개의 스카이 박스가 등록되어 있어야 하며 섞음 정도를 조절하는 블랜딩 변수를 가지고 있어야 한다.

    // Start is called before the first frame update
    void Start()
    {
        float Bland = MyMat.GetFloat("_Blend");
        DayTime = StartTime;
        //MyMat = new Material(TestSkyBox);
    }

    // Update is called once per frame
    void Update()
    {
        DayTime += TimeSpeed * Time.deltaTime;
        
        if (DayTime >= 24)
            DayTime = 0;

        SunObj.transform.rotation =  Quaternion.Euler(  (DayTime - DayStartTime) * (360 / 24), 0, 0);

        if ( (SunSetTimeMax + NightStartTime >= DayTime && NightStartTime <= DayTime) || (SunSetTimeMax + DayStartTime >= DayTime && DayStartTime <= DayTime) )
        {
            if( SunSetTime == 0 )
                SunSetTime = SunSetTimeMax;
            
            if (DayTime >= DayStartTime)
                MyMat.SetFloat("_Blend", 1- (SunSetTimeMax - SunSetTime) / SunSetTimeMax);
            if (DayTime >= NightStartTime)
                MyMat.SetFloat("_Blend", (SunSetTimeMax - SunSetTime) / SunSetTimeMax);
            SunSetTime -= TimeSpeed * Time.deltaTime;            
        }
        else
        {
            if (DayTime >= DayStartTime + SunSetTimeMax)
            {
                MyMat.SetFloat("_Blend", 0);
                SunSetTime = 0;
            }
            if (DayTime >= NightStartTime + SunSetTimeMax || (DayTime >= 0 && DayTime <= DayStartTime + SunSetTime))
            {
                MyMat.SetFloat("_Blend", 1);
                SunSetTime = 0;
            }
        }

    }
}
