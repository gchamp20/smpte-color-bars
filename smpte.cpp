#include <QSocketNotifier>
#include <QSurfaceFormat>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <cstdio>

#include "config.h"

int main(int argc, char* argv[])
{
	QSurfaceFormat surfaceFormat;
	surfaceFormat.setRedBufferSize(5);
	surfaceFormat.setGreenBufferSize(6);
	surfaceFormat.setBlueBufferSize(5);
	surfaceFormat.setAlphaBufferSize(0);
	QSurfaceFormat::setDefaultFormat(surfaceFormat);

	QGuiApplication app(argc, argv);
	QGuiApplication::setApplicationName("smpte-color-bars");
	QGuiApplication::setApplicationVersion(PROJECT_VERSION);

	QQmlApplicationEngine engine;
	engine.addImportPath("qrc:");
	engine.load("qrc:/smpte.qml");

	/* exit on any keypress */
	QSocketNotifier* stdinNotifier = new QSocketNotifier(fileno(stdin), QSocketNotifier::Read, nullptr);
	QObject::connect(stdinNotifier, &QSocketNotifier::activated, [&] {
		std::getchar();
		app.exit(0);
	});

	return app.exec();
}
