#ifndef IMAGECLASSPROVIDER_H
#define IMAGECLASSPROVIDER_H
#include <QQuickImageProvider>
#include <QPixmap>
#include <QImage>
#include "imageclass.h"


class ImageClassProvider : public QQuickImageProvider
{
public:
    ImageClassProvider(QQuickImageProvider::ImageType type, ImageClass &ic);
    QImage requestImage(const QString& id, QSize* size, const QSize& requestedSize);
 //   QPixmap requestPixmap(const QString& id, QSize* size, const QSize& requestedSize);

    void updateImg(QImage new_img);
private:

    QImage providedImg;
    ImageClass *iclass_img;

    void setImageClass(QImage *img);                        //ustawia wskaznik na aktualny obiekt
    void updProvided(QImage toUpdate);
};

#endif // IMAGECLASSPROVIDER_H
