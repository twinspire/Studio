package twinspire.studio;

enum abstract StateView(Int) from Int to Int
{
    var STATE_NONE                  =   0;
    var STATE_SCENES                =   1;
    var STATE_SETTINGS              =   2;
}