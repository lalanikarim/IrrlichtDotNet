#ifndef PATH_PROXY_H
#define PATH_PROXY_H

#include "irrAllocator.h"
#include "irrString.h"
#include "path.h"

using namespace irr;
using namespace io;

class path_proxy
{
public:
    path_proxy(path p):m_path(p) {}
    path_proxy(const char* const c):m_path(c){}
    path getPath(){return m_path;}
    stringc getStringc(){return (stringc)m_path;}
    stringw getStringw(){return (stringw)m_path;}
    const fschar_t * getString(){return m_path.c_str();}
private:
    path m_path;
};

#endif // PATH_PROXY_H
