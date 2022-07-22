#ifndef IMAGECLASS_H
#define IMAGECLASS_H

#include <QObject>
#include <QVector>
#include <QString>
#include <QImage>
#include <QQuickImageProvider>


class ImageClass : public QObject
{
    Q_OBJECT
public:
    explicit ImageClass(QObject *parent = nullptr);

    void getImgDimensions(QImage &img);
    QPixmap requestPixmap(const QString &id);
    QString LoadedPath;

    int width;
    int height;

private:
    QImage img;
    QVector <QRgb> img_rgb;


signals:
    void receivedImgDimensions();
    void updateView();

public slots:
    bool loadImage(QString path);

    bool resizeImg(int w, int h);
    bool rotate(int degree);

    bool flipLeftRight();
    bool flipUpDown();
    void rgbRModify(int value);
    void rgbGModify(int value);
    void rgbBModify(int value);


    bool saveImg();
    bool saveAsImg(QString path);
    int getImgX();
    int getImgY();

    QImage returnImg();
};

#endif // IMAGECLASS_H
