#!/bin/bash
ramfs_size_mb=1536
ramfs_size_sectors=$((ramfs_size_mb*1024*1024/512))
mount_point=/Users/${USER}/ramdisk
ramdisk_device=$(hdid -nomount ram://${ramfs_size_sectors} | xargs)
USERRAMDISK="${mount_point}"

umount -f "${mount_point}"
newfs_hfs -v 'ramdisk' "${ramdisk_device}"
mkdir -p "${mount_point}"
mount -o noatime -t hfs "${ramdisk_device}" "${mount_point}"
mdutil -i off "${mount_point}"
#rm -rf "${mount_point}"/{,_.}{fseventsd,Spotlight-V*,Trashes}
rm -rf "${mount_point}"/{,_.}{fseventsd,Spotlight-V*}
mkdir "${mount_point}"/.fseventsd
#touch "${mount_point}"/.fseventsd/no_log "${mount_point}"/.metadata_never_index "${mount_point}"/.Trashes
touch "${mount_point}"/.fseventsd/no_log "${mount_point}"/.metadata_never_index

/bin/mkdir -p "${USERRAMDISK}"/temp
/bin/mkdir -p "${USERRAMDISK}"/wget

/bin/rm -rf ~/Downloads
/bin/mkdir -p "${USERRAMDISK}"/Downloads
/bin/ln -s "${USERRAMDISK}"/Downloads ~/Downloads

/bin/rm -rf ~/Library/Caches/Google
/bin/mkdir -p "${USERRAMDISK}"/Library/Caches/Google
/bin/ln -s "${USERRAMDISK}"/Library/Caches/Google ~/Library/Caches/Google

/bin/rm -rf ~/Library/Caches/Firefox
/bin/mkdir -p "${USERRAMDISK}"/Library/Caches/Firefox
/bin/ln -s "${USERRAMDISK}"/Library/Caches/Firefox ~/Library/Caches/Firefox

/bin/rm -rf ~/Library/Caches/com.apple.Safari
/bin/mkdir -p "${USERRAMDISK}"/Library/Caches/com.apple.Safari
/bin/ln -s "${USERRAMDISK}"/Library/Caches/com.apple.Safari ~/Library/Caches/com.apple.Safari

/bin/rm -rf ~/Library/Caches/com.apple.Safari.SafeBrowsing
/bin/mkdir -p "${USERRAMDISK}"/Library/Caches/com.apple.Safari.SafeBrowsing
/bin/ln -s "${USERRAMDISK}"/Library/Caches/com.apple.Safari.SafeBrowsing ~/Library/Caches/com.apple.Safari.SafeBrowsing

/bin/rm -rf ~/Library/Caches/com.apple.iTunes
/bin/mkdir -p "${USERRAMDISK}"/Library/Caches/com.apple.iTunes
/bin/ln -s "${USERRAMDISK}"/Library/Caches/com.apple.iTunes ~/Library/Caches/com.apple.iTunes

/bin/rm -rf ~/Library/Caches/com.sequelpro.SequelPro
/bin/mkdir -p "${USERRAMDISK}"/Library/Caches/com.sequelpro.SequelPro
/bin/ln -s "${USERRAMDISK}"/Library/Caches/com.sequelpro.SequelPro ~/Library/Caches/com.sequelpro.SequelPro

/bin/rm -rf ~/Library/"Application Support"/VSCodium/Cache
/bin/mkdir -p "${USERRAMDISK}"/Library/"Application Support"/VSCodium/Cache
/bin/ln -s "${USERRAMDISK}"/Library/"Application Support"/VSCodium/Cache ~/Library/"Application Support"/VSCodium/Cache

/bin/rm -rf ~/Library/"Application Support"/VSCodium/CachedData
/bin/mkdir -p "${USERRAMDISK}"/Library/"Application Support"/VSCodium/CachedData
/bin/ln -s "${USERRAMDISK}"/Library/"Application Support"/VSCodium/CachedData ~/Library/"Application Support"/VSCodium/CachedData

/bin/rm -rf ~/Library/"Application Support"/VSCodium/CachedExtensions
/bin/mkdir -p "${USERRAMDISK}"/Library/"Application Support"/VSCodium/CachedExtensions
/bin/ln -s "${USERRAMDISK}"/Library/"Application Support"/VSCodium/CachedExtensions ~/Library/"Application Support"/VSCodium/CachedExtensions
