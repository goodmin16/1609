USE [master]
GO
/****** Object:  Database [TURI]    Script Date: 12.05.2024 22:08:11 ******/
CREATE DATABASE [TURI]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TURI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TURI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TURI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TURI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TURI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TURI] SET ARITHABORT OFF 
GO
ALTER DATABASE [TURI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TURI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TURI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TURI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TURI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TURI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TURI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TURI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TURI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TURI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TURI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TURI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TURI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TURI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TURI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TURI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TURI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TURI] SET RECOVERY FULL 
GO
ALTER DATABASE [TURI] SET  MULTI_USER 
GO
ALTER DATABASE [TURI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TURI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TURI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TURI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TURI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TURI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TURI', N'ON'
GO
ALTER DATABASE [TURI] SET QUERY_STORE = OFF
GO
USE [TURI]
GO
/****** Object:  Table [dbo].[Applicatio]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicatio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idKlient] [int] NULL,
	[idTuri] [int] NULL,
	[ArrivalDate] [date] NULL,
	[idSotrudnik] [int] NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[Phone] [float] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[idRole] [int] NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otel]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Addres] [nvarchar](150) NULL,
	[Rating] [float] NULL,
	[Description] [nvarchar](500) NULL,
	[idCity] [int] NULL,
	[idCountry] [int] NULL,
 CONSTRAINT [PK_Otel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtelServices]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelServices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idServices] [int] NULL,
	[idOtel] [int] NULL,
 CONSTRAINT [PK_OtelServices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudnik]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudnik](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](250) NULL,
	[Phone] [float] NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[idRole] [int] NULL,
 CONSTRAINT [PK_Sotrudnik] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turi]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[idCountry] [int] NULL,
	[idOtel] [int] NULL,
	[DepartureDate] [date] NULL,
	[ArrivalDate] [date] NULL,
	[Information] [nvarchar](max) NULL,
	[idTypeOfFood] [int] NULL,
 CONSTRAINT [PK_Turi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfFood]    Script Date: 12.05.2024 22:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeOfFood] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Applicatio] ON 

INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (1, 1, 1, CAST(N'2024-09-24' AS Date), 1, 60000, 10000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (2, 2, 2, CAST(N'2024-10-30' AS Date), 2, 23500, 2000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (3, 3, 3, CAST(N'2024-12-01' AS Date), 3, 86000, 5000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (4, 4, 4, CAST(N'2024-09-21' AS Date), 4, 35000, 4000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (5, 5, 5, CAST(N'2024-01-10' AS Date), 5, 57000, 4000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (6, 6, 6, CAST(N'2024-05-08' AS Date), 1, 74000, 4000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (7, 7, 7, CAST(N'2024-04-06' AS Date), 1, 35000, 10000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (8, 8, 8, CAST(N'2024-04-13' AS Date), 2, 41000, 1000)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (9, 9, 9, CAST(N'2024-04-20' AS Date), 3, 74000, 24444)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (10, 10, 10, CAST(N'2024-04-18' AS Date), 4, 89999, 22344)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (11, 1, 11, CAST(N'2024-06-30' AS Date), 5, 22222, 100)
INSERT [dbo].[Applicatio] ([id], [idKlient], [idTuri], [ArrivalDate], [idSotrudnik], [Price], [Discount]) VALUES (12, 2, 12, CAST(N'2024-06-22' AS Date), 2, 45799, 555)
SET IDENTITY_INSERT [dbo].[Applicatio] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [Name]) VALUES (1, N'Хубвал')
INSERT [dbo].[City] ([id], [Name]) VALUES (2, N'Хурачи')
INSERT [dbo].[City] ([id], [Name]) VALUES (3, N'Муларгарх')
INSERT [dbo].[City] ([id], [Name]) VALUES (4, N'Ваке')
INSERT [dbo].[City] ([id], [Name]) VALUES (5, N'Бахавалшах')
INSERT [dbo].[City] ([id], [Name]) VALUES (6, N'Хайдарсадда')
INSERT [dbo].[City] ([id], [Name]) VALUES (7, N'Бхавар')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [Name]) VALUES (1, N'Россия')
INSERT [dbo].[Country] ([id], [Name]) VALUES (2, N'Египет')
INSERT [dbo].[Country] ([id], [Name]) VALUES (3, N'Турция')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Klient] ON 

INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (1, N'Софронов Алексей Матвеевич', 79086117120, N'33', N'33', N'gaufroicriquebo-5307@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (2, N'Масленникова Антонина Артемьевна', 79011557943, N'545', N'76575', N'neseiproufresso-5818@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (3, N'Ершова Виктория Кирилловна', 79961174412, N'24346', N'456464', N'quecroutteubrouttei-9230@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (4, N'Антонов Илья Константинович', 79004007895, N'24234435', N'565467', N'refrocannoiqui-2487@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (5, N'Михайлова Василиса Максимовна', 79086319450, N'2', N'2', N'hikitreubeco-8518@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (6, N'Ильина Анастасия Александровна', 79955002439, N'2156467', N'456768', N'zissaubrekoibi-3469@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (7, N'Крючкова Анна Андреевна', 77113775724, N'432456', N'563452', N'rejaujizena-8154@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (8, N'Павлова Виктория Григорьевна', 75365067571, N'235456325', N'254535', N'vosaulloippeubeu-6329@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (9, N'Попов Николай Иванович', 79011557943, N'65345635', N'24243465', N'gerubeyemoi-3151@yopmail.com', 2)
INSERT [dbo].[Klient] ([id], [FIO], [Phone], [Login], [Password], [Email], [idRole]) VALUES (10, N'Столяров Михаил Богданович', 79086319450, N'46867878980', N'3453575687', N'bilevauduro-7546@yopmail.com', 2)
SET IDENTITY_INSERT [dbo].[Klient] OFF
GO
SET IDENTITY_INSERT [dbo].[Otel] ON 

INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (1, N'The Gallant Squirrel', N'625856, г. Тюмень, ул. Мичурина, 25, оф. 53', 4, N'Именно в этом здании раньше останавливались императоры, прежде чем венчаться на царство. Отель предлагает более 40 номеров, которые по достоинству оценят любители роскоши. Апартаменты обставлены дизайнерской мебелью в классическом стиле, отличаются простором и выходят на живописный двор. На территории расположены бассейн, тренажерный зал, а также сауна и турецкая баня. В отеле оборудовано несколько конференц-залов, что понравится деловым людям.

', 1, 1)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (2, N'The Aged Bee', N'350 Çopur Mill Apt. 975', 5, N'Это настоящий замок, который был построен по указу Павла I в конце XVIII века. Объект расположен в живописном месте и является частью парка «Мариенталь». В отеле более 20 номеров, выдержанных в ампирном стиле. Здесь каждый сможет почувствовать себя гостем императорской резиденции. Каждый номер выполнен в индивидуальном дизайне, что по достоинству оценят любители эксклюзивных интерьеров.', 2, 2)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (3, N'The Humorous Nightingale', N'53737 Manço Club Apt. 758', 3, N'Отель рассчитан на 24 спальных места и разделен на два жилых модуля. Компактное, уютное и гостеприимное место для ночлега в живописной горной местности – все, что нужно для туриста. Здесь можно комфортно поспать, расположиться с вещами, а также воспользоваться гостиной-кафе. Панорамные окна открывают потрясающий вид на горы. Здесь круглогодично царит сказочная атмосфера.', 5, 3)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (4, N'The Sly Whale', N'
3138 Şafak Plaza Apt. 529', 4, N'Здесь можно арендовать уютный деревянный коттедж в необычном дизайне с зеркальными вставками или поселиться в одном из авторских номеров Дома Пионеров. В каждом доме есть необходимая мебель и бытовые приборы. Также гостям предоставляется прекрасная возможность познакомиться с самым комфортным видом кемпинга – глэмпингом.  Живописные места, тишина, чистый воздух – все это позволит отдохнуть от городской суеты. На территории предусмотрены велопрогулки, игры в волейбол и другие развлечения.', 3, 2)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (5, N'The Jolly Jackal', N'
83423 Zinnure Isle', 4, N'Это место, находящееся в непосредственной близости от стадиона, позволяет постояльцам воочию наслаждаться захватывающими матчами. Именно поэтому гостиница весьма популярна среди футбольных фанатов.', 4, 2)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (6, N'The Bewildered Fox', N'
5736 Kavurt Inlet Suite 907', 5, N'Обстановка, мебель, элементы декора, архитектура здания – все пропитано духом того времени. Стоит отметить, что реставрация старинного здания началась 10 лет назад. Идею восстановления поддержала семья предпринимателей Головичер. Вместе с единомышленниками им удалось восстановить и отремонтировать дом крестьянина Мартьяна Сазонова. ', 5, 3)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (7, N'The Tranquil Jester', N'
375 Mihrab Branch Apt. 792', 4, N'Несколько палаток расположены на деревянных настилах и удалены друг от друга, чтобы гости могли насладиться одиночеством. Вокруг живописные места, лес с деревьями и растениями редких видов и потрясающий горный ландшафт, который может смело посоревноваться с Альпами. Палатки оборудованы необходимой мебелью для комфорта и уюта. ', 6, 2)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (8, N'The Jovial Viper', N'
07246 Mehmed Islands Suite 788', 5, N'Здесь предусмотрено 20 номеров различной категории. Здание выдержано в средневековом стиле, является аналогом крепости Тевтонского ордена. Гости могут не только приблизиться к истории и хорошо провести время, но и почувствовать себя настоящими рыцарями, примерив доспехи. ', 7, 2)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (9, N'The Mirthful Fox', N'344830, г. Ростов-на-Дону, ул. Речная, 25, оф. 100', 4, N'В отеле есть библиотека, а сами помещения выполнены в современном стиле по проекту дизайнера Ольги Солдатовой. Гостям предлагают одновременно компактные и уютные номера. Отель расположен недалеко от сада «Эрмитаж» и Пушкинской площади.', 1, 1)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (10, N'The Lost Cockatrice', N'450369, г. Уфа, ул. Больничная, 46, оф. 40', 5, N'Размещение возможно в собственной или взятой в аренду палатке или мобильном домике. Кемпинг располагается в тихом живописном месте с чистым воздухом. Это отличное место для отдыха и ночлега для тех, кто решил ознакомиться с культурными достопримечательностями Коломны.', 2, 1)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (11, N'The Noble Serpent', N'394582, г. Воронеж, ул. Пролетарская, 9, оф. 34', 5, N'Ленинградская область, поселок Запорожское Приозерского района. Это место любят экотуристы, рыбаки, а также отдыхающие, которые желают насладиться чистым воздухом и лесным массивом вдали от городской суеты. Здесь есть русская баня с березовыми вениками, недалеко расположены водоемы, в которых можно половить рыбу. ', 3, 1)
INSERT [dbo].[Otel] ([id], [Name], [Addres], [Rating], [Description], [idCity], [idCountry]) VALUES (12, N'The Laughing Raven', N'443725, г. Самара, ул. Пионерская, 11, оф. 1', 5, N'Домодедово, Московская область. Это удивительное место, которое откроет мир сказки взрослым и детям. Главной особенностью являются номера, выполненные в сказочном стиле. Один перенесет вас в морской мир, другой – в русскую деревню с жизнерадостными подсолнухами, третий – на пушистые облака.', 5, 1)
SET IDENTITY_INSERT [dbo].[Otel] OFF
GO
SET IDENTITY_INSERT [dbo].[OtelServices] ON 

INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (1, 1, 1)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (2, 2, 1)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (3, 3, 1)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (4, 5, 1)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (5, 1, 2)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (6, 2, 2)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (7, 3, 2)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (8, 4, 2)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (9, 5, 2)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (10, 2, 3)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (11, 6, 3)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (12, 5, 3)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (13, 1, 4)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (14, 3, 4)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (15, 4, 4)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (16, 6, 4)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (17, 5, 4)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (18, 2, 5)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (19, 1, 5)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (20, 6, 5)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (21, 3, 5)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (22, 3, 6)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (23, 2, 6)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (24, 1, 6)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (25, 4, 6)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (26, 6, 7)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (27, 3, 7)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (28, 2, 7)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (29, 1, 7)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (30, 1, 8)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (31, 2, 8)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (32, 3, 8)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (33, 1, 9)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (34, 4, 9)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (35, 6, 10)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (36, 5, 10)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (37, 3, 10)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (38, 2, 10)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (39, 1, 11)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (40, 2, 11)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (41, 6, 11)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (42, 5, 12)
INSERT [dbo].[OtelServices] ([id], [idServices], [idOtel]) VALUES (43, 4, 12)
SET IDENTITY_INSERT [dbo].[OtelServices] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([id], [Name]) VALUES (2, N'Пользователь')
INSERT [dbo].[Role] ([id], [Name]) VALUES (3, N'Админ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([id], [Name]) VALUES (1, N'SPA')
INSERT [dbo].[Services] ([id], [Name]) VALUES (2, N'Free Wi-fi')
INSERT [dbo].[Services] ([id], [Name]) VALUES (3, N'Бар')
INSERT [dbo].[Services] ([id], [Name]) VALUES (4, N'Бассейн')
INSERT [dbo].[Services] ([id], [Name]) VALUES (5, N'пппп')
INSERT [dbo].[Services] ([id], [Name]) VALUES (6, N'Спортзал')
INSERT [dbo].[Services] ([id], [Name]) VALUES (7, NULL)
INSERT [dbo].[Services] ([id], [Name]) VALUES (8, NULL)
INSERT [dbo].[Services] ([id], [Name]) VALUES (9, N'вцв')
INSERT [dbo].[Services] ([id], [Name]) VALUES (10, N'dwdawd')
INSERT [dbo].[Services] ([id], [Name]) VALUES (11, NULL)
INSERT [dbo].[Services] ([id], [Name]) VALUES (12, N'yyy')
INSERT [dbo].[Services] ([id], [Name]) VALUES (13, N'd')
INSERT [dbo].[Services] ([id], [Name]) VALUES (14, N'ввфцв')
INSERT [dbo].[Services] ([id], [Name]) VALUES (15, N'аау')
INSERT [dbo].[Services] ([id], [Name]) VALUES (16, N'вцв')
INSERT [dbo].[Services] ([id], [Name]) VALUES (17, N'ппп')
INSERT [dbo].[Services] ([id], [Name]) VALUES (18, N'ннннн')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Sotrudnik] ON 

INSERT [dbo].[Sotrudnik] ([id], [FIO], [Phone], [Email], [Password], [Login], [idRole]) VALUES (1, N'Федоров Мирон Степанович', 79047153690, N'reinequaffufro-9526@yopmail.com', N'1', N'1', 1)
INSERT [dbo].[Sotrudnik] ([id], [FIO], [Phone], [Email], [Password], [Login], [idRole]) VALUES (2, N'Петрова Марьяна Александровна', 79392578942, N'bromounoukibreu-7376@yopmail.com', N'4535547', N'745е2354кв', 1)
INSERT [dbo].[Sotrudnik] ([id], [FIO], [Phone], [Email], [Password], [Login], [idRole]) VALUES (3, N'Орлова Варвара Николаевна', 79922597357, N'prigrauyefesau-3576@yopmail.com', N'квачап456', N'675кпуыаф', 1)
INSERT [dbo].[Sotrudnik] ([id], [FIO], [Phone], [Email], [Password], [Login], [idRole]) VALUES (4, N'Анисимова Виктория Ярославовна', 79003961616, N'loiholaugripo-3339@yopmail.com', N'46567пвкп', N'124235укавыс', 1)
INSERT [dbo].[Sotrudnik] ([id], [FIO], [Phone], [Email], [Password], [Login], [idRole]) VALUES (5, N'Золотарева Кристина Максимовна', 78667099902, N'hanneicroralou-5596@yopmail.com', N'23к346кум', N'у23к346еа', 1)
INSERT [dbo].[Sotrudnik] ([id], [FIO], [Phone], [Email], [Password], [Login], [idRole]) VALUES (8, N'Петкин Андрей Вага', 83922397442, N'edwdawd.dwddw', N'90', N'90', 3)
SET IDENTITY_INSERT [dbo].[Sotrudnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Turi] ON 

INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (1, N'Как в первый раз', 1, 1, CAST(N'2024-09-30' AS Date), CAST(N'2024-09-24' AS Date), N'10, ноябрь 2014) появился любимый многими вид смерти — от утопления.', 2)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (2, N'Сладкая жизнь', 2, 2, CAST(N'2024-10-23' AS Date), CAST(N'2024-10-30' AS Date), N'Разве что теперь вид надгробия зависит не от достижений сима до смерти, а от принадлежности к определенному оккультному виду.', 3)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (3, N'Горы и песок', 1, 3, CAST(N'2024-11-22' AS Date), CAST(N'2024-12-01' AS Date), N'Была у них саблезубая курочка Ряба.', 2)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (4, N'Славная тусовка', 2, 4, CAST(N'2024-09-30' AS Date), CAST(N'2024-09-21' AS Date), N'Я люблю цветочки, и не только.', 5)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (5, N'Жизнь хороша', 2, 5, CAST(N'2024-03-12' AS Date), CAST(N'2024-01-10' AS Date), N'КС, Х — тут мы имеем дело с женщинами, готовыми совершать спонтанные поступки.', 4)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (6, N'Незабываемо', 3, 6, CAST(N'2024-04-28' AS Date), CAST(N'2024-05-08' AS Date), N'Катался на лыжах, сломал руку, ногу, нос, ухо и угодил в больницу.', 1)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (7, N'Мамамия', 2, 7, CAST(N'2024-03-25' AS Date), CAST(N'2024-04-06' AS Date), N'Моя девушка учиться просто так.', 2)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (8, N'Медовый месяц', 2, 8, CAST(N'2024-09-26' AS Date), CAST(N'2024-04-13' AS Date), N'Мой кумир учиться просто так.', 6)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (9, N'Челентано', 1, 9, CAST(N'2024-09-09' AS Date), CAST(N'2024-04-20' AS Date), N'Мой кумир учиться просто так.', 7)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (10, N'Oтдичные воспоминания', 1, 10, CAST(N'2024-10-06' AS Date), CAST(N'2024-04-18' AS Date), N'Для примера нам показали ноутбук HP, который всего за сутки стал дороже более чем на 1000 рублей.', 2)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (11, N'Я живу и мне нужен совет', 1, 11, CAST(N'2024-09-18' AS Date), CAST(N'2024-06-30' AS Date), N'5 минут майнкрафта.', 4)
INSERT [dbo].[Turi] ([id], [Name], [idCountry], [idOtel], [DepartureDate], [ArrivalDate], [Information], [idTypeOfFood]) VALUES (12, N'Время лечит', 1, 12, CAST(N'2024-07-29' AS Date), CAST(N'2024-06-22' AS Date), N'Вчера Игорь принес на урок зверька, который называется карликовый шершавый медведь.', 7)
SET IDENTITY_INSERT [dbo].[Turi] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfFood] ON 

INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (1, N'RO')
INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (2, N'BB')
INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (3, N'HB')
INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (4, N'FB')
INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (5, N'AI')
INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (6, N'FB+')
INSERT [dbo].[TypeOfFood] ([id], [Name]) VALUES (7, N'HB+')
SET IDENTITY_INSERT [dbo].[TypeOfFood] OFF
GO
ALTER TABLE [dbo].[Applicatio]  WITH CHECK ADD  CONSTRAINT [FK_Application_Klient] FOREIGN KEY([idKlient])
REFERENCES [dbo].[Klient] ([id])
GO
ALTER TABLE [dbo].[Applicatio] CHECK CONSTRAINT [FK_Application_Klient]
GO
ALTER TABLE [dbo].[Applicatio]  WITH CHECK ADD  CONSTRAINT [FK_Application_Sotrudnik] FOREIGN KEY([idSotrudnik])
REFERENCES [dbo].[Sotrudnik] ([id])
GO
ALTER TABLE [dbo].[Applicatio] CHECK CONSTRAINT [FK_Application_Sotrudnik]
GO
ALTER TABLE [dbo].[Applicatio]  WITH CHECK ADD  CONSTRAINT [FK_Application_Turi] FOREIGN KEY([idTuri])
REFERENCES [dbo].[Turi] ([id])
GO
ALTER TABLE [dbo].[Applicatio] CHECK CONSTRAINT [FK_Application_Turi]
GO
ALTER TABLE [dbo].[Klient]  WITH CHECK ADD  CONSTRAINT [FK_Klient_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Klient] CHECK CONSTRAINT [FK_Klient_Role]
GO
ALTER TABLE [dbo].[Otel]  WITH CHECK ADD  CONSTRAINT [FK_Otel_City] FOREIGN KEY([idCity])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Otel] CHECK CONSTRAINT [FK_Otel_City]
GO
ALTER TABLE [dbo].[Otel]  WITH CHECK ADD  CONSTRAINT [FK_Otel_Country] FOREIGN KEY([idCountry])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Otel] CHECK CONSTRAINT [FK_Otel_Country]
GO
ALTER TABLE [dbo].[OtelServices]  WITH CHECK ADD  CONSTRAINT [FK_OtelServices_Otel] FOREIGN KEY([idOtel])
REFERENCES [dbo].[Otel] ([id])
GO
ALTER TABLE [dbo].[OtelServices] CHECK CONSTRAINT [FK_OtelServices_Otel]
GO
ALTER TABLE [dbo].[OtelServices]  WITH CHECK ADD  CONSTRAINT [FK_OtelServices_Services] FOREIGN KEY([idServices])
REFERENCES [dbo].[Services] ([id])
GO
ALTER TABLE [dbo].[OtelServices] CHECK CONSTRAINT [FK_OtelServices_Services]
GO
ALTER TABLE [dbo].[Sotrudnik]  WITH CHECK ADD  CONSTRAINT [FK_Sotrudnik_Role] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Sotrudnik] CHECK CONSTRAINT [FK_Sotrudnik_Role]
GO
ALTER TABLE [dbo].[Turi]  WITH CHECK ADD  CONSTRAINT [FK_Turi_Country] FOREIGN KEY([idCountry])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Turi] CHECK CONSTRAINT [FK_Turi_Country]
GO
ALTER TABLE [dbo].[Turi]  WITH CHECK ADD  CONSTRAINT [FK_Turi_Otel] FOREIGN KEY([idOtel])
REFERENCES [dbo].[Otel] ([id])
GO
ALTER TABLE [dbo].[Turi] CHECK CONSTRAINT [FK_Turi_Otel]
GO
ALTER TABLE [dbo].[Turi]  WITH CHECK ADD  CONSTRAINT [FK_Turi_TypeOfFood] FOREIGN KEY([idTypeOfFood])
REFERENCES [dbo].[TypeOfFood] ([id])
GO
ALTER TABLE [dbo].[Turi] CHECK CONSTRAINT [FK_Turi_TypeOfFood]
GO
USE [master]
GO
ALTER DATABASE [TURI] SET  READ_WRITE 
GO
