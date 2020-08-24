#include <QCommandLineOption>
#include <QCommandLineParser>
#include <QImage>
#include <QSocketNotifier>
#include <QSurfaceFormat>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <cstdio>
#include <map>

#include "config.h"

static QImage::Format convertStringToSurfaceFormat(const QString& str)
{

	const std::map<QString, QImage::Format> COLOR_FORMAT_DICT{{"RGB565", QImage::Format_RGB16},
	                                                          {"RGBX8888", QImage::Format_RGBX8888}};

	auto search = COLOR_FORMAT_DICT.find(str);
	if (search != COLOR_FORMAT_DICT.end())
	{
		return search->second;
	}
	qWarning() << "Surface format '" << str << "' not recognized, using RGX8888.";
	return COLOR_FORMAT_DICT.find("RGBX8888")->second;
}

static void setSurfaceFormat(QImage::Format format)
{
	QSurfaceFormat surfaceFormat;
	switch (format)
	{
	case QImage::Format_RGB16:
		surfaceFormat.setRedBufferSize(5);
		surfaceFormat.setGreenBufferSize(6);
		surfaceFormat.setBlueBufferSize(5);
		surfaceFormat.setAlphaBufferSize(0);
		break;
	default:
		surfaceFormat.setRedBufferSize(8);
		surfaceFormat.setGreenBufferSize(8);
		surfaceFormat.setBlueBufferSize(8);
		surfaceFormat.setAlphaBufferSize(8);
		break;
	}
	QSurfaceFormat::setDefaultFormat(surfaceFormat);
}

int main(int argc, char* argv[])
{
	QCommandLineParser parser;
	const QCommandLineOption surfaceFormatOption{QStringList() << "f"
	                                                           << "format",
	                                             "Surface format to use.",
	                                             "format",
	                                             "RGBX8888"};
	parser.setApplicationDescription("SMPTE color bars test");
	parser.addHelpOption();
	parser.addVersionOption();
	parser.addOption(surfaceFormatOption);

	QGuiApplication app(argc, argv);
	QGuiApplication::setApplicationName("smpte-color-bars");
	QGuiApplication::setApplicationVersion(PROJECT_VERSION);

	parser.process(app);

	setSurfaceFormat(convertStringToSurfaceFormat(parser.value(surfaceFormatOption)));

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
