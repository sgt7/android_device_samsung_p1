The proprietary daemon "tvoutserver" expects the system to tell it
when the frames should be refreshed. Samsung implemented this by
integrating TV Out in surfaceflinger and other graphic services.
However, we will just run a daemon that brute sends the signal every
150 ms.