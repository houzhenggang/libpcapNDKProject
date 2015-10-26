#Application.mk目的是描述在你的应用程序中所需要的模块(即静态库或动态库)。
#Application.mk文件通常被放置在 $PROJECT/jni/Application.mk下，$PROJECT指的是您的项目。

#APP_PROJECT_PATH  ： 这个变量是强制性的，并且会给出应用程序工程的根目录的一个绝对路径。
#                                       这是用来复制或者安装一个没有任何版本限制的JNI库，从而给APK生成工具一个详细的路径。


#APP_ABI：编译架构，so文件都会打在apk中，而且会依据系统CPU架构进行安装。如下两种方法：
#方法1、创建Application.mk文件，则在该文件添加，APP_ABI := armeabi armeabi-v7a x86
#方法2、在ndk-build 参数中添加，APP_ABI="armeabi armeabi-v7a x86"
#比如：
#    为了在ARMv7的设备上支持硬件FPU指令。可以使用  APP_ABI := armeabi-v7a 
#    或者为了支持IA-32指令集，可以使用      APP_ABI := x86 
#    或者为了同时支持这三种，可以使用       APP_ABI := armeabi armeabi-v7a x86

APP_ABI = armeabi armeabi-v7a x86

#APP_OPTIM：这个变量是可选的，用来定义“release”或"debug"。在编译您的应用程序模块的时候，可以用来改变优先级。
#     "release"模式是默认的，并且会生成高度优化的二进制代码。
#     "debug"模式生成的是未优化的二进制代码，但可以检测出很多的BUG，可以用于调试。
# 注意：如果你的应用程序是可调试的（即，如果你的清单文件在它的<application>标签中把android:debuggable属性设为true），
#          默认将是debug而非release。把APP_OPTIM设置为release可以覆写它。
# 注意：可以调试release和debug版二进制，但release版构建倾向于在调试会话中提供较少信息：一些变量被优化并且不能被检测，
#          代码重新排序可能致使代码步进变得困难，堆栈跟踪可能不可靠，等等。

#APP_OPTIM := release

#APP_CFLAGS：一个C编译器开关集合，在编译任意模块的任意C或C++源代码时传递。它可以用于改变一个给定的应用程序需要依赖的模块的构建，而不是修改它自身的Android.mk文件



#警告的意思就是说,使用的Native API Version比最低版本Java API要高,可能导致的问题就是:
#在Native Code里使用了一个platforms/android-14下的API函数,然后程序在 android-8 的设备上运行,当然这个函数在android-8设备上是不存在的,就会崩溃了
APP_PLATFORM := android-8
APP_OPTIM := debug

#APP_STL ：默认，NDK构建系统提供由Android系统给出的最小C++运行时库（/system/lib/libstdc++.so）的C++头文件。
#                        然而，NDK带有另一个C++实现，你可以在你自己的应用程序中使用或链接它。
#                        定义APP_STL以选择它们其中的一个：  APP_STL := stlport_static       -->     static STLport library
#                                                                                          APP_STL := stlport_shared    -->     shared STLport library
#                                                                                           APP_STL := system               -->      default C++ runtime library

#APP_STL := gnustl_static

#APP_PIE := false