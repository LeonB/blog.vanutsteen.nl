---
title: Adobe PDFmaker
date: 2004-09-23 23:35 +01:00
layout: post
tags:
 - windows
 - adobe
categories:
  - Windows
published: true
banner: 
summary:
---
When I started working at TIM_online I got a second hand laptop from them. It's a pity isn't a brand new one, but hey: I'm really pleased with it.
Yesterday I installed Adobe Acrobat on it. With Acrobat you can create PDF files and print to a virtual PDF maker. I know, OpenOffice does that by default, but I like using Office when I'm using Microsoft Windows.

But the downside of Adobe Acrobat is that it installs this really annoying toolbars and menus where ever it can. I searched the Internet on how to remove them. And I collected the possible ways here......

If you use Outlook, the first thing you have to do is open regedit and change a registry key.

The easiest way to do that is toch hit the "windows key" and the "R" and the same time. Now type "regedit" (without the quotes) and klik "OK".

Now navigate your way to:
`HKEY_LOCAL_MACHINE / Software / Microsoft / Office / Outlook / Addins / PDFMOutlook.PDFMOutlook`
And the change the LoadBehaviour value from 3 to 0 by clicking it and changing the value in the popup.

But that's not all. That was only to get rid of the pdfmaker toolbar in outlook. To disable it in Word, Excell, etcetera do the following:

Open Windows Explorer (easiest way to do this is clicking the windowskey + the "e") and navigate to:
`C:Program FilesMicrosoft OfficeOffice10Startup`
If you have office 2003 it will be:
`C:Program FilesMicrosoft OfficeOffice11Startup`

And remove the pdfmaker file. It's all done now.
Check here, for some aditional information.