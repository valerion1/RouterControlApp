#include "control.h"

Control::Control(){
    manager = new QNetworkAccessManager();
    connect(manager, SIGNAL(finished(QNetworkReply*)),
                this, SLOT(replyFinished(QNetworkReply*)));
}

Control::~Control(){
    delete manager;
}

void Control::reboot(){
    QUrl urlUser("http://admin:admin@192.168.0.1/userRpm/SysRebootRpm.htm?Reboot=1");

    QNetworkRequest request(urlUser);
    request.setRawHeader("Host", "192.168.0.1");
    request.setRawHeader("User-Agen:", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0");
    request.setRawHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
    request.setRawHeader("Accept-Language", "ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3");
    request.setRawHeader("Referer", "http://192.168.0.1/userRpm/SysRebootRpm.htm");
    request.setRawHeader("Authorization", "Basic YWRtaW46YWRtaW4=");


    manager->get(request);
}

void Control::replyFinished(QNetworkReply *reply)
{
    if(reply->error()){
        emit info(QString("ERROR: " + reply->errorString()));
    }
    else{
//        emit info(QString(reply->attribute(QNetworkRequest::HttpReasonPhraseAttribute).toString() +
//                          "\n" +
//                          reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toString()));
        emit info(QString(reply->readAll()));
    }

    reply->deleteLater();
}
