import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

class LidarrCatalogueData {
    final Map<String, dynamic> api = Database.currentProfileObject.getLidarr();
    String title;
    String sortTitle;
    String overview;
    String path;
    int artistID;
    int qualityProfile;
    int metadataProfile;
    String quality;
    String metadata;
    bool monitored;
    bool albumFolders;
    Map statistics;
    List genres;
    List links;
    String foreignArtistID;
    int sizeOnDisk;

    LidarrCatalogueData({
        @required this.title,
        @required this.sortTitle,
        @required this.overview,
        @required this.path,
        @required this.artistID,
        @required this.monitored,
        @required this.statistics,
        @required this.qualityProfile,
        @required this.metadataProfile,
        @required this.quality,
        @required this.metadata,
        @required this.genres,
        @required this.links,
        @required this.albumFolders,
        @required this.foreignArtistID,
        @required this.sizeOnDisk,
    });

    String get genre {
        if(genres == null || genres.length == 0) {
            return 'Unknown';
        }
        return genres[0];
    }

    String get subtitle {
        return '$albums\t•\t$tracks\n${sizeOnDisk?.lsBytes_BytesToString()}';
    }

    String get tracks {
        return statistics['totalTrackCount'] == 1 ? '${statistics['trackCount']} Track' : '${statistics['trackCount']} Tracks';
    }

    String get albums {
        return statistics['albumCount'] == 1 ? '${statistics['albumCount']} Album' : '${statistics['albumCount']} Albums';
    }

    String get bandsintownURI {
        for(var link in links) {
            if(link['name'] == 'bandsintown') {
                return link['url'];
            }
        }
        return '';
    }

    String get discogsURI {
        for(var link in links) {
            if(link['name'] == 'discogs') {
                return link['url'];
            }
        }
        return '';
    }

    String get lastfmURI {
        for(var link in links) {
            if(link['name'] == 'last') {
                return link['url'];
            }
        }
        return '';
    }

    String posterURI({bool highRes = false}) {
        if(api['enabled']) {
            return highRes
                ? '${api['host']}/api/v1/MediaCover/Artist/$artistID/poster.jpg?apikey=${api['key']}'
                : '${api['host']}/api/v1/MediaCover/Artist/$artistID/poster-500.jpg?apikey=${api['key']}';
        }
        return '';
    }

    String fanartURI({bool highRes = false}) {
        if(api['enabled']) {
            return highRes
                ? '${api['host']}/api/v1/MediaCover/Artist/$artistID/fanart.jpg?apikey=${api['key']}'
                : '${api['host']}/api/v1/MediaCover/Artist/$artistID/fanart-360.jpg?apikey=${api['key']}';
        }
        return '';
    }

    String bannerURI({bool highRes = false}) {
        if(api['enabled']) {
            return highRes
                ? '${api['host']}/api/v1/MediaCover/Artist/$artistID/banner.jpg?apikey=${api['key']}'
                : '${api['host']}/api/v1/MediaCover/Artist/$artistID/banner-70.jpg?apikey=${api['key']}';
        }
        return '';
    }
}