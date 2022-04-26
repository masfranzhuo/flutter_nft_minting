import 'package:flutter_dotenv/flutter_dotenv.dart';

String getImageFromJson(String json) => json
    .toString()
    .replaceFirst('ipfs://', 'https://gateway.pinata.cloud/ipfs/')
    .replaceFirst(dotenv.env['JSON_CID']!, dotenv.env['IMAGES_CID']!)
    .replaceFirst('.json', '.png');
