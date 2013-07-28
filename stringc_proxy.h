#ifndef STRINGC_PROXY_H
#define STRINGC_PROXY_H

#include "irrAllocator.h"
#include "irrString.h"

using namespace irr;
using namespace core;

class stringc_proxy : public stringc
{
public:
    stringc_proxy(stringc strc):stringc(strc) {}
    stringc_proxy(const char* const c):stringc(c){}
    stringc* getStringc(){return (stringc*)this;}
};

#endif // STRINGC_PROXY_H
