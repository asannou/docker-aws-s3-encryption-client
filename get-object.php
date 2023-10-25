<?php

require __DIR__ . '/vendor/autoload.php';

use Aws\S3\S3Client;
use Aws\S3\Crypto\S3EncryptionClientV2;
use Aws\Kms\KmsClient;
use Aws\Crypto\KmsMaterialsProviderV2;

ini_set('display_errors', 'stderr');

$options = getopt('', [
  'bucket:',
  'key:',
]);

$s3Client = new S3Client([]);
$encryptionClient = new S3EncryptionClientV2($s3Client);

$kmsClient = new KmsClient([]);
$materialsProvider = new KmsMaterialsProviderV2($kmsClient);

$result = $encryptionClient->getObject([
  '@KmsAllowDecryptWithAnyCmk' => true,
  '@SecurityProfile' => 'V2_AND_LEGACY',
  '@MaterialsProvider' => $materialsProvider,
  'Bucket' => $options['bucket'],
  'Key' => $options['key'],
]);

fwrite(STDOUT, $result['Body']);

