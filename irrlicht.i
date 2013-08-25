%module(directors="1") IrrlichtDotNet
%{
#include "vector2du32_proxy.h"
#include "vector3du32_proxy.h"
//#include "stringc_proxy.h"
//#include "stringw_proxy.h"
//#include "path_proxy.h"
#include "iostream"
#include "irrlicht.h"

#include "SWIGIEventReceiver.h"

using namespace irr;
using namespace core;
using namespace video;
using namespace scene;
using namespace gui;
using namespace io;

%}


/* name conversionfor overloadedoperators. */
%rename(add) *::operator+;
%rename(pos) *::operator+();
%rename(pos) *::operator+() const;
%rename(sub) *::operator-;
%rename(neg) *::operator-() const;
%rename(neg) *::operator-();
%rename(mul) *::operator*;
%rename(deref) *::operator*();
%rename(deref) *::operator*() const;
%rename(div) *::operator/;
%rename(mod) *::operator%;
%rename(logxor) *::operator^;
%rename(logand) *::operator&;
%rename(logior) *::operator|;
%rename(lognot) *::operator~();
%rename(lognot) *::operator~() const;
%rename(op_not) *::operator!();
%rename(op_not) *::operator!() const;
%rename(assign) *::operator=;
%rename(add_assign) *::operator+=;
%rename(sub_assign) *::operator-=;
%rename(mul_assign) *::operator*=;
%rename(div_assign) *::operator/=;
%rename(mod_assign) *::operator%=;
%rename(logxor_assign) *::operator^=;
%rename(logand_assign) *::operator&=;
%rename(logior_assign) *::operator|=;
%rename(lshift) *::operator<<;
%rename(lshift_assign) *::operator<<=;
%rename(rshift) *::operator>>;
%rename(rshift_assign) *::operator>>=;
%rename(eq) *::operator==;
%rename(ne) *::operator!=;
%rename(lt) *::operator<;
%rename(gt) *::operator>;
%rename(lte) *::operator<=;
%rename(gte) *::operator>=;
%rename(logand)  *::operator&&;
%rename(logor)  *::operator||;
%rename(preincr)  *::operator++();
%rename(postincr)  *::operator++(int);
%rename(predecr)  *::operator--();
%rename(postdecr)  *::operator--(int);
%rename(comma)  *::operator,();
%rename(comma)  *::operator,() const;
%rename(member_ref)  *::operator->;
%rename(member_func_ref) *::operator->*;
%rename(funcall)  *::operator();
%rename(aref) 	*::operator[];
%rename(tostringc) *::operator core::stringc() const;
%rename(tostringw) *::operator core::stringw() const;

%rename(irrstring) irr::core::stringc;

%ignore irr::core::vector2d<unsigned int>::getLength() const;
%ignore irr::core::squareroot(unsigned int);
%ignore irr::core::squareroot(const irr::core::f32 f);
%ignore irr::core::squareroot(const irr::core::f64 f);
%ignore irr::core::squareroot(const irr::core::s32 f);
%ignore irr::core::squareroot(const irr::core::s64 f);
%ignore irr::scene::ISceneNode::setName(const core::stringc& name);

%typemap(cstype)  path& "String"
%typemap(imtype)  path& "String"
%typemap(csout)  path& {
   return $imcall;$excode
}
%typemap(out)  path& %{
    char *tempString = new char[$1->size()];
    for(u32 tc = 0; tc < $1->size(); tc++)
    {
        tempString[tc] = (*$1)[tc];
    }
    $result = tempString;
%}

%apply path& {irr::io::path&, const path&, const io::path&, stringc&, const stringc&, irr::core::stringc&, const irr::core::stringc&};

%typemap(csin)  path& "$csinput"
//    pre=" path_proxy temp$csinput = new path_proxy($csinput);") const  path& "$csclassname.getCPtr(temp$csinput.getPath())"
%typemap(in)  path& %{
   $1 = new path((fschar_t *)$input);
%}

%apply path& {const path&, irr::io::path&, const irr::io::path&, io::path&, const io::path&};

%typemap(csin)  stringc& "$csinput"
%typemap(in)  stringc& %{
   $1 = new stringc((char *)$input);
%}

%apply stringc& {const stringc&, irr::core::stringc&, const irr::core::stringc&};

%typemap(cstype) path "String"
%typemap(imtype) path "String"
%typemap(csout) path {
   return $imcall;$excode
}
%typemap(out) path %{
    fschar_t *tempString = new fschar_t[$1.size()];
    for(u32 tc = 0; tc < $1.size(); tc++)
    {
        tempString[tc] = (*&$1)[tc];
    }
    $result = tempString;
%}

%apply path {irr::io::path}

%typemap(cstype) stringc "String"
%typemap(imtype) stringc "String"
%typemap(csout) stringc {
   return $imcall;$excode
}
%typemap(out) stringc %{
    char *tempString = new char[$1.size()];
    for(u32 tc = 0; tc < $1.size(); tc++)
    {
        tempString[tc] = (*&$1)[tc];
    }
    $result = tempString;
%}
%typemap(csin)  stringc "$csinput"
%typemap(in)  stringc %{
   $1 = new stringc((char *)$input);
%}
/*
%typemap(csvarin, excode=SWIGEXCODE2) core::stringc %{
    set {
      $imcall;$excode
    } %}

%typemap(csvarout, excode=SWIGEXCODE2) core::stringc %{
    get {
      return $imcall;$excode
    } %}
*/
%apply stringc {core::stringc, irr::core::stringc};
/*%inline %{

namespace irr
{
namespace io
{
 enum E_FILE_ARCHIVE_TYPE {
  EFAT_ZIP = ((int) 'Z'|((int) 'I' << 8)|((int) 'P' << 16)|((int) (0) << 24)),
  EFAT_GZIP = ((int) 'g'|((int) 'z' << 8)|((int) 'i' << 16)|((int) 'p' << 24)),
  EFAT_FOLDER = ((int) 'f'|((int) 'l' << 8)|((int) 'd' << 16)|((int) 'r' << 24)),
  EFAT_PAK = ((int) 'P'|((int) 'A' << 8)|((int) 'K' << 16)|((int) (0) << 24)),
  EFAT_NPK = ((int) 'N'|((int) 'P' << 8)|((int) 'K' << 16)|((int) (0) << 24)),
  EFAT_TAR = ((int) 'T'|((int) 'A' << 8)|((int) 'R' << 16)|((int) (0) << 24)),
  EFAT_WAD = ((int) 'W'|((int) 'A' << 8)|((int) 'D' << 16)|((int) (0) << 24)),
  EFAT_UNKNOWN = ((int) 'u'|((int) 'n' << 8)|((int) 'k' << 16)|((int) 'n' << 24))
};
}
}
%}
*/
%include "wchar.i"
%include "arrays_csharp.i"

%include "typemaps.i"

%apply float INPUT[] { f32* floats }

%include "irrTypes.h"
%include "irrMath.h"
%include "irrList.h"
%include "irrMap.h"
%include "irrAllocator.h"
%include "irrString.h"
%include "irrArray.h"
%include "triangle3d.h"
%include "vector2d.h"
%include "vector3d.h"

%include "quaternion.h"
%include "rect.h"


%include "Keycodes.h"


%include "ECullingTypes.h"
%include "EDebugSceneTypes.h"
%include "EDriverFeatures.h"
%include "EDriverTypes.h"
%include "EDeviceTypes.h"
%include "EGUIAlignment.h"
%include "EGUIElementTypes.h"
%include "EHardwareBufferFlags.h"
%include "EMaterialFlags.h"
%include "EMaterialTypes.h"
//%include "EMeshWriterEnums.h"
%include "EMessageBoxFlags.h"
%include "ESceneNodeAnimatorTypes.h"
//%include "ESceneNodeTypes.h"
%include "ETerrainElements.h"
%include "EAttributes.h"
%include "IReferenceCounted.h"

%include "IrrCompileConfig.h"
%include "aabbox3d.h"
%include "CDynamicMeshBuffer.h"
//%include "CIndexBuffer.h"
%include "CMeshBuffer.h"
%include "coreutil.h"
//%include "CVertexBuffer.h"
%include "dimension2d.h"
%include "fast_atof.h"
%include "heapsort.h"

%include "ILogger.h"

%include "SColor.h"
%include "S3DVertex.h"
%include "SceneParameters.h"
%include "SExposedVideoData.h"

%include "SIrrCreationParameters.h"
%include "SKeyMap.h"
%include "SLight.h"
%include "SMaterial.h"
%include "SMesh.h"
%include "SMeshBuffer.h"
%include "SMeshBufferLightMap.h"
%include "SMeshBufferTangents.h"
%include "SParticle.h"
%include "SSharedMeshBuffer.h"
%include "SSkinMeshBuffer.h"
%include "SVertexIndex.h"
%include "SViewFrustum.h"

%include "IAttributeExchangingObject.h"
%include "IAttributes.h"
%include "ISceneNode.h"

%include "IBillboardSceneNode.h"
%include "IBillboardTextSceneNode.h"
%include "IBoneSceneNode.h"
%include "ICameraSceneNode.h"
%include "ICursorControl.h"
%include "IDummyTransformationSceneNode.h"
%include "IDynamicMeshBuffer.h"


%feature("director") IEventReceiver;

%include "IEventReceiver.h"
%include "SWIGIEventReceiver.h"

%include "IReadFile.h"
//%include "IFileArchive.h"
%include "IFileList.h"
%include "IFileSystem.h"
//%include "IGPUProgrammingServices.h"
//%include "IGUIButton.h"
//%include "IGUICheckBox.h"
//%include "IGUIColorSelectDialog.h"
//%include "IGUIComboBox.h"
//%include "IGUIContextMenu.h"
//%include "IGUIEditBox.h"
//%include "IGUIElement.h"
//%include "IGUIElementFactory.h"
//%include "IGUIEnvironment.h"
//%include "IGUIFileOpenDialog.h"
//%include "IGUIFont.h"
//%include "IGUIFontBitmap.h"
//%include "IGUIImage.h"
//%include "IGUIInOutFader.h"
//%include "IGUIListBox.h"
//%include "IGUIMeshViewer.h"
//%include "IGUIScrollBar.h"
//%include "IGUISkin.h"
//%include "IGUISpinBox.h"
//%include "IGUISpriteBank.h"
//%include "IGUIStaticText.h"
//%include "IGUITabControl.h"
//%include "IGUITable.h"
//%include "IGUIToolbar.h"
//%include "IGUIWindow.h"
//%include "IGUITreeView.h"
%include "IImage.h"
%include "IImageLoader.h"
%include "IImageWriter.h"
%include "IIndexBuffer.h"
%include "ILightSceneNode.h"
%include "IMaterialRenderer.h"
%include "IMaterialRendererServices.h"
%include "IMesh.h"
%include "IMeshBuffer.h"
%include "IMeshCache.h"
%include "IMeshLoader.h"
%include "IMeshManipulator.h"

%include "IMeshSceneNode.h"
%include "IGeometryCreator.h"

%include "IAnimatedMesh.h"

%include "SAnimatedMesh.h"

%include "IAnimatedMeshMD2.h"
//%include "IAnimatedMeshMD3.h"

%include "IMeshWriter.h"
%include "IColladaMeshWriter.h"
%include "IMetaTriangleSelector.h"
%include "IOSOperator.h"
%include "IParticleSystemSceneNode.h" // also includes all emitters and attractors
//%include "IQ3LevelMesh.h"
//%include "IQ3Shader.h"
%include "IRandomizer.h"


%include "path.h"
%include "ISceneCollisionManager.h"
%include "ISceneLoader.h"
%include "ISkinnedMesh.h"

%include "ISceneManager.h"
%include "ISceneNodeAnimator.h"
%include "ISceneNodeAnimatorCameraFPS.h"
%include "ISceneNodeAnimatorCameraMaya.h"
%include "ISceneNodeAnimatorCollisionResponse.h"
%include "ISceneNodeAnimatorFactory.h"
%include "ISceneNodeFactory.h"
%include "ISceneUserDataSerializer.h"
%include "IShaderConstantSetCallBack.h"
%include "IShadowVolumeSceneNode.h"
%include "ITerrainSceneNode.h"
%include "ITextSceneNode.h"
%include "ITexture.h"
%include "ITimer.h"
%include "ITriangleSelector.h"
%include "IVertexBuffer.h"
%include "IVideoModeList.h"
%include "IVolumeLightSceneNode.h"
%include "IWriteFile.h"
%include "IXMLReader.h"
%include "IXMLWriter.h"
%include "ILightManager.h"
%include "IVideoDriver.h"
%include "IAnimatedMeshSceneNode.h"

%include "irrXML.h"

%include "line2d.h"
%include "line3d.h"
%include "matrix4.h"
%include "plane3d.h"
%include "position2d.h"

%include "IrrlichtDevice.h"
%include "vector2du32_proxy.h"
%include "vector3du32_proxy.h"
//%include "stringc_proxy.h"
//%include "stringw_proxy.h"
//%include "path_proxy.h"

%include "irrlicht.h"


//%template(vector2du) irr::core::vector2d< u32 >;
%template(vector2df) irr::core::vector2d< f32 >;
%template(vector2di) irr::core::vector2d< s32 >;

%template(dimension2du) irr::core::dimension2d<u32>;
%template(dimension2df) irr::core::dimension2d<f32>;
%template(dimension2di) irr::core::dimension2d<s32>;

//%template(vector3du) irr::core::vector3d<u32>;
%template(vector3df) irr::core::vector3d<f32>;
%template(vector3di) irr::core::vector3d<s32>;

%template(aabbox3df) irr::core::aabbox3d<f32> ;
%template(aabbox3di) irr::core::aabbox3d<s32>;


/*

%typemap(cstype) path "String"
%typemap(imtype) path "String"
%typemap(csout) path {
    return $imcall;$excode
}

%typemap(out) path %{
    std::cout << $1.c_str() << std::endl;
    char *tempString = new char[$1.size()];
    for(u32 tc = 0; tc < $1.size(); tc++)
    {
        tempString[tc] = (*&$1)[tc];
    }
    $result = tempString;
%}

%typemap(cstype) const  path& "String"
%typemap(imtype) const  path& "String"
%typemap(csout) const  path& {
    return $imcall;$excode
}

%typemap(out) const  path& %{
    std::cout << $1->c_str() << std::endl;
    char *tempString = new char[$1->size()];
    for(u32 tc = 0; tc < $1->size(); tc++)
    {
        tempString[tc] = (*$1)[tc];
    }
    $result = tempString;
%}
%typemap(csin) const  path& "$csclassname.getCPtr($csinput)"
%typemap(in) const  path& %{
    $1 = new path(static_cast<char *>( $input));
%}
*/
%inline %{

irr::core::stringc test_stringConversion()
{
   const irr::core::stringc str = "test me";
   return str;
}

%}

%inline %{
path test_getPath()
{
    return path("test path");
}
%}

