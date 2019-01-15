import "dart:async";
import 'package:chopper/chopper.dart';

part "test_service.chopper.dart";

@ChopperApi(baseUrl: "/test")
abstract class HttpTestService extends ChopperService {
  static HttpTestService create([ChopperClient client]) =>
      _$HttpTestService(client);

  @Get(path: "get/{id}")
  Future<Response> getTest(
    @Path() String id, {
    @Header('test') String dynamicHeader,
  });

  @Post(path: "post")
  Future<Response> postTest(@Body() String data);

  @Put(path: 'put/{id}')
  Future<Response> putTest(@Path('id') String test, @Body() String data);

  @Delete(path: 'delete/{id}', headers: {'foo': 'bar'})
  Future<Response> deleteTest(@Path() String id);

  @Patch(path: 'patch/{id}')
  Future<Response> patchTest(@Path() String id, @Body() String data);

  @Post(path: 'map')
  Future<Response> mapTest(@Body() Map map);

  @Post(path: 'map/json')
  @JsonEncoded()
  Future<Response> forceJsonTest(@Body() Map map);

  @Post(path: 'map/form')
  @FormUrlEncoded()
  Future<Response> forceFormTest(@Body() Map map);

  @Post(path: 'multi')
  @multipart
  Future<Response> postResources(
    @Part('1') Map a,
    @Part('2') Map b,
  );

  @Post(path: 'file')
  @multipart
  Future<Response> postFile(
    @FileField('file') List<int> bytes,
  );
}
