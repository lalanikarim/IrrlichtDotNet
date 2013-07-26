#ifndef VECTOR_PROXY_H
#define VECTOR_PROXY_H
#include "irrTypes.h"
#include "vector2d.h"
#include "math.h"

using namespace irr;
using namespace core;
class vector2du32_proxy
{
public:
    vector2du32_proxy();
    vector2d<u32> get(){return vector2du32;}
    u32 get_X(){return vector2du32.X;}
    u32 get_Y(){return vector2du32.Y;}
    void set_X(u32 x){vector2du32.X = x;}
    void set_Y(u32 y){vector2du32.Y = y;}
    vector2d<u32> set(u32 x, u32 y){return vector2du32.set(x,y);}
    void set(vector2d<u32> vec){vector2du32 = vector2d<u32>(vec);}
    u32 getLength(){return sqrt(get_X() * get_X() + get_Y() * get_Y());}
private:
    vector2d<u32> vector2du32;
};

#endif // VECTOR_PROXY_H
