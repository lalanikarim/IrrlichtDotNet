%module(directors="1") irrlichtDotNet
%{
#include "vector2du32_proxy.h"
#include "vector3du32_proxy.h"
#include "stringc_proxy.h"
#include "irrlicht.h"

#include "SWIGIEventReceiver.h"

using namespace irr;
using namespace core;
using namespace video;
using namespace scene;
using namespace gui;
using namespace io;

%}
%ignore irr::io::E_FILE_ARCHIVE_TYPE;

%inline %{

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

%ignore irr::core::vector2d<unsigned int>::getLength() const;
%ignore irr::core::squareroot(unsigned int);
%ignore irr::core::squareroot(const irr::core::f32 f);
%ignore irr::core::squareroot(const irr::core::f64 f);
%ignore irr::core::squareroot(const irr::core::s32 f);
%ignore irr::core::squareroot(const irr::core::s64 f);

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
%include "stringc_proxy.h"

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

%template(irrAllocatorChar) irr::core::irrAllocator<char>;
%template(stringc) irr::core::string<char,irrAllocatorChar>;
//%template(stringw) irr::core::string<wchar_t,irr::core::irrAllocator<wchar_t>>;

//%template(path) irr::core::string<irr::fschar_t>;
