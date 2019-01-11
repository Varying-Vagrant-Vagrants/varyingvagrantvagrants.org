---
category: 8. TLS and HTTPS
order: 2
title: Trusting the Certificate Authority
description: Trusting the Certificate Authority
permalink: /docs/en-US/references/https/trusting-ca/
---

Once the main authority certificate is trusted by your operating system or browser, all certificates VVV generates will always be trusted. The details of how to do this will depend on your platform, but to do so you will need to know where the certificate is located.

You can find the central certificate in `certificates/ca/ca.crt`. There are some caveats though:

 - This only works for your instance of VVV, you cannot use this to generate certificates for other VVV users.
 - This will only work on your machine, this cannot be used to generate an SSL certificate for a live website.
 - This will never work for `.dev` domains, Google have preloaded Chrome with security policies, and Firefox has followed suit. These cannot be dismissed. Since the `.dev` TLD is owned and used by Google it isn't safe, switch to `.test` TLDs.

### Trusting the VVV Root Certificate On MacOS / OS X

* Import the `certificates/ca/ca.crt` file into Keychain Access by double-clicking on the file in finder.
* Right-click the certificate and click Get Info.
* Expand the Trust section at the top, and under `Secure Sockets Layer (SSL)`, select `Always Trust`.
* Close the window. You'll be prompted to enter your password to save the changes.

### Trusting the VVV Root Certificate in Firefox

Firefox uses its own root certificate list, to access it:

 - go to options, and under Privacy & Security
 - go to the certificates section and click "View Certificates" 
 - In the Certificate Manager window, switch to the Authorities tab and click the "Import..." button.
 - In the file open dialogue that pops up, select the VVV root certificate in your VVV folder at `certificates/ca/ca.crt`
 - When Firefox asks you what you want to use the certificate for, check the box marked "Trust this CA to identify websites" and click Ok
 - You should now see the `VVV INTERNAL` certificate authority in the list.

### Trusting the VVV Root Certificate on Windows 10

 - Press the windows key + R, to bring up the run dialogue
 - Enter `secpol.msc` and press Ok
 - The Local security policy window/snapin should appear
 - On the side menu, click Public Key Policies > Certificate Path Validation Settings.
 - Then in Certificate Path Validation Settings Properties, under *Store* tab, check *Define these policy settings*. Make sure you check *Allow user trusted root CAs to be used to validate certificates* and *Allow users to trust peer trust certificates* options here. Under Root certificates stores, select *Third-Party Root CAs and Enterprise Root CAs* option. Click Apply followed by OK.
 - Close the Local Security Policy window/snap-in.
 - Press windows key + R again, to bring up the run dialogue
 - Enter `certmgr.msc` and press Ok
 - In the Certificate Manager window, click *Trusted Root Certification Authorities > Certificates*.
 - Right click on *Certificates* and select *All Tasks > Import*.
 - Now in Certificate Import Wizard, click Next.
 - Then click on browse and select the VVV certificate root file in your VVV folder: `certificates/ca/ca.crt`, then click Next.
 - On the next screen, choose *Automatically select the certificate store based on the type of certificate* option. Hit Next.
 - Click Finish to finally import the certificate to Trusted Root Certification Authorities store.
 - In few seconds, you’ll receive the confirmation saying *The import was successful* which means the new certificate is installed and ready for use.

### Trusting the VVV Root Certificate on iOS

You will need to place the authority somewhere mobile Safari can access. Make sure nobody can see this as it could be a security risk, and remove the file once installed.

 - Download the `ca.crt` file in safari.
 - iOS will prompt you to install the certificate.
 - Tap install on each screen until the certificate is trusted.

Be mindful that doing this from an app such as Microsoft OneDrive or Google Drive may not work.

You can verify the certificate is installed by going to `Settings->General->Profiles`. This option will only appear if profiles are installed, if it's missing then the operation was unsuccessful.

### Trusting the VVV Root Certificate on Android

Note that this is possible on Android 4-7, earlier versions require a rooted device;

> System-installed certificates can be managed on the Android device in the Settings -> Security -> Certificates -> 'System'-section, whereas the user trusted certificates are managed in the 'User'-section there. When using user trusted certificates, Android will force the user of the Android device to implement additional safety measures: the use of a PIN-code, a pattern-lock or a password to unlock the device are mandatory when user-supplied certificates are used.

Android 8/N and later require changes to an app manifest, greatly limiting the use cases. Here's an extract from the Charles Proxy website:

> As of Android N, you need to add configuration to your app in order to have it trust the SSL certificates generated by Charles SSL Proxying. This means that you can only use SSL Proxying with apps that you control.
> 
> In order to configure your app to trust Charles, you need to add a Network Security Configuration File to your app. This file can override the system default, enabling your app to trust user installed CA certificates (e.g. the Charles Root Certificate). You can specify that this only applies in debug builds of your application so that production builds use the default trust profile.

### Trusting the VVV Root Certificate on Other Operating Systems

If you are running a different operating system than the ones listed above then you will need to find the instructions. Installing a Root Certificate is not specific to VVV, it is a system operation. 

This means you should be able to find a guide by searching for something like "&lt;your operating system&gt; install root certificate"

If you can't find instructions via Google, try checking instructions specific to your browser. A lot of browsers have their own list of authorities you can add to and their own certificate managers.

There are more instructions on [the CACert wiki here](http://wiki.cacert.org/FAQ/ImportRootCert).
