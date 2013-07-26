#ifndef VECTOR3DU32_PROXY_H
#define VECTOR3DU32_PROXY_H

#include "irrTypes.h"
#include "vector3d.h"
#include "math.h"

using namespace irr;
using namespace core;
class vector3du32_proxy
{
public:
    vector3du32_proxy(){}

    vector3d<u32> get(){return vector3du32;}
    u32 get_X(){return vector3du32.X;}
    u32 get_Y(){return vector3du32.Y;}
    u32 get_Z(){return vector3du32.Z;}
    void set_X(u32 x){vector3du32.X = x;}
    void set_Y(u32 y){vector3du32.Y = y;}
    void set_Z(u32 z){vector3du32.Z = z;}
    vector3d<u32> set(u32 x, u32 y, u32 z){return vector3du32.set(x,y,z);}
    void set(vector3d<u32> vec){vector3du32 = vector3d<u32>(vec);}
    u32 getLength(){return sqrt(get_X() * get_X() + get_Y() * get_Y() + get_Z() * get_Z());}
private:
    vector3d<u32> vector3du32;
};

#endif // VECTOR3DU32_PROXY_H


