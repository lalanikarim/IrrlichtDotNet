#ifndef STRINGW_PROXY_H
#define STRINGW_PROXY_H

#include "irrAllocator.h"
#include "irrString.h"

using namespace irr;
using namespace core;

class stringw_proxy
{
public:
    stringw_proxy(stringw strw):str(strw) {}
    stringw_proxy(const wchar_t* const c):str(c){}
    stringw getStringw(){return str;}
    const wchar_t * getString(){return str.c_str();}
private:
    stringw str;
};

#endif // STRINGW_PROXY_H

