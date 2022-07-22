#include "imageclass.h"
#include <QDebug>
#include <QTransform>
#include <QPainter>

ImageClass::ImageClass(QObject *parent)
    : QObject{parent}
{
    qDebug()<<"Image object was created";
}

bool ImageClass::resizeImg(int w, int h)
{
    if(w<=0 || h<=0)
    {
        qDebug()<<"Error resizing image. Wrong values!";
        return false;
    }
    else{
        this->img = img.scaled(w, h, Qt::IgnoreAspectRatio);
        width = w;
        height = h;
       // img = img.scaled();
        qDebug()<<"Image resized correctly";

        emit updateView();
    }

    return true;
}

int ImageClass::getImgX()
{
    return width;
}

int ImageClass::getImgY()
{
    return height;
}

bool ImageClass::rotate(int degree)
{

    QPixmap pxmap = QPixmap::fromImage(this->img);

    QTransform transform;

    QTransform trans = transform.rotate(degree);
    QPixmap *transformedPixmap = new QPixmap(pxmap.transformed(trans));
    this->img = transformedPixmap->toImage();
    this->getImgDimensions(this->img);
    emit updateView();
    return true;

}

bool ImageClass::flipLeftRight(){
    QPixmap pxmap = QPixmap::fromImage(this->img);

    QTransform transform;

    QTransform trans = transform.scale(-1, 1);
    QPixmap *transformedPixmap = new QPixmap(pxmap.transformed(trans));
    this->img = transformedPixmap->toImage();
    this->getImgDimensions(this->img);
    emit updateView();
    return true;
}

bool ImageClass::flipUpDown(){
    QPixmap pxmap = QPixmap::fromImage(this->img);

    QTransform transform;

    QTransform trans = transform.scale(1, -1);
    QPixmap *transformedPixmap = new QPixmap(pxmap.transformed(trans));
    this->img = transformedPixmap->toImage();
    this->getImgDimensions(this->img);
    emit updateView();
    return true;
}


void ImageClass::rgbRModify(int value)
{
    qDebug() << "R: " <<  value;
}
void ImageClass::rgbGModify(int value)
{
    qDebug() << "G: " <<  value;
}
void ImageClass::rgbBModify(int value)
{
    qDebug() << "B: " <<  value;
}

QImage ImageClass::returnImg()
{
    return img;
}

void ImageClass::getImgDimensions(QImage &img)
{

    width = img.width();
    height = img.height();

    emit receivedImgDimensions();
}

QPixmap ImageClass::requestPixmap(const QString &id)
{
   QPixmap pixmap(this->width, this->height);
   pixmap.fill(QColor(id).rgba());
   return pixmap;
}

bool ImageClass::saveImg()
{
    if(img.isNull()!=true)
    {
        if(img.save(LoadedPath, 0, -1)==true)
        {
            qDebug()<<"Image saved correctly";
            return true;
        }
        else{
            qDebug()<<"Failed save";
            return false;
        }
    }
    else{
        return false;
    }
    // QImage::save();
}

bool ImageClass::saveAsImg(QString path)
{
    if(img.isNull()!=true)
    {
        if(img.save(path, 0, -1)==true)
        {
            qDebug()<<"Image saved correctly [filepath = "<<path <<"]";
            return true;
        }
        else{
            qDebug()<<"Failed save";
            return false;
        }
    }
    else{
        return false;
    }
}



bool ImageClass::loadImage(QString path)
{
    QImage temp_img(path);
    if(temp_img.isNull() == false)
    {
        LoadedPath = path; //zapamietanie sciezki
        qDebug()<<"ImageClass > Image loaded correctly [filepath = "<<path <<"]";
        img = temp_img;
        getImgDimensions(temp_img);

        img_rgb = img.colorTable();

        return true;
    }
    else{
        qDebug()<<"ImageClass > Image load error.";
        return false;
    }
}
