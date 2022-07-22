#include "imageclassprovider.h"
#include <QDebug>

ImageClassProvider::ImageClassProvider(QQuickImageProvider::ImageType type, ImageClass &ic) :
    QQuickImageProvider(type)
{
   // type = QQuickImageProvider::ImageType::Image;
    iclass_img = &ic;

    qDebug() << "Halo tutaj imageProvider!";
    // This space intentionally left blank.
}

QImage ImageClassProvider::requestImage(const QString& id, QSize* size, const QSize& requestedSize)
{
  //  providedImg.load(iclass_img->LoadedPath);
    providedImg = iclass_img->returnImg();
    return providedImg;
}

void ImageClassProvider::updateImg(QImage new_img)
{
    providedImg = new_img;
  //  providedImg.convertToColorSpace();
  //  providedImg.convertTo()
}







//QPixmap ImageClassProvider::requestPixmap(const QString& id, QSize* size, const QSize& requestedSize)
//{
////    QString rsrcid = ":/" + id;
////    QPixmap image(rsrcid);
////    QPixmap result;
////qDebug() << "Halo tutaj requestPixmap!";
;
//////    QStringList idCall = id.split("/");
//////    QString namePhoto = idCall[0]; //przekazuje pierwsze co wystepuje po "/" -

//////    if(namePhoto == "mainImageView")
//////    {
//////        result.convertFromImage(providedImg, Qt::AutoColor);
//////    }


//////    if (requestedSize.isValid()) {
//////        qDebug() << "Halo tutaj requestPixmap! 1 ";
//////        result = image.scaled(requestedSize, Qt::KeepAspectRatio);
//////    } else {
//////        result = image;
//////        qDebug() << "Halo tutaj requestPixmap! 2 ";
//////    }
//////    *size = result.size();

////return result;
//}



