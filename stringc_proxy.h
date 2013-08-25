#ifndef STRINGC_PROXY_H
#define STRINGC_PROXY_H

#include "irrAllocator.h"
#include "irrString.h"

using namespace irr;
using namespace core;

class stringc_proxy
{
public:
    stringc_proxy(stringc strc):str(strc) {}
    stringc_proxy(const char* const c):str(c){}
    stringc getStringc(){return str;}
    const char * getString(){return str.c_str();}
private:
    stringc str;
};

#endif // STRINGC_PROXY_H
