Feature: Single scenario having all CRUD operation in one scenario
Background:
  * configure headers = {Accept: '*/*', Connection: 'Keep-Alive', User-Agent: 'PostmanRuntime/7.32.3',Accept-Encoding:'gzip, deflate, br'}

  Scenario: : Sample BlobAPI
    Given url 'https://qmjecta007sa.blob.core.windows.net'
    And path 'gps/gpsresults/2023/08/26/Asia/Tokyo/FS74HZ500122XXXXX.gz?sig=JYctY9PXMeBHYmx8hGv7SoiuldougySrn2%2FBcwFH7pk%3D&st=2023-08-28T08%3A28%3A01Z&se=2023-08-29T08%3A28%3A01Z&sv=2017-04-17&sp=r&sr=b'
    And params {sig: 'JYctY9PXMeBHYmx8hGv7SoiuldougySrn2%2FBcwFH7pk%3D', st: '2023-08-28T08%3A28%3A01Z', se: '2023-08-29T08%3A28%3A01Z', sv: '2017-04-17', sp: 'r',sr: 'b'}
    When method get
    And status 200