#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "imageclass.h"
#include "imageclassprovider.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    ImageClass myImgClass;
    ImageClassProvider myImgProvider (QQuickImageProvider::Image, myImgClass);

    QQmlContext *rootContext = engine.rootContext();
    rootContext->setContextProperty("myImageClass", &myImgClass);

    engine.addImageProvider(QLatin1String("imageProvider"), &myImgProvider);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}


// qmlRegisterType <ImageClass>("ImgClass", 1,0, "ImageClass");
//  &myImgProvider.ImageResponse
  ///myImgProvider.Image = myImgClass.returnImg();
//   engine.addImageProvider(myImgClass.requestPixmap("myImg"));

//    QQmlComponent *component = new QQmlComponent(&engine);
//    component->loadUrl(QUrl("../../Source/main.qml"));
//    engine.addImageProvider("myImageClassProvider", );
