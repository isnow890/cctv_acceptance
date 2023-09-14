import 'dart:io';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';
const USER_ID = 'USER_ID';
const ROLE = 'ROLE';

const WAIT_TIME = 555;

const TEST_USER_ID = 'admin';
const TEST_PASSWORD = 'sodmadkr1103@';

const CANNOT_PROCESS_DATA_MESSAGE = '데이터를 처리하지 못했습니다.';
const CANNOT_GET_DATA_MESSAGE = '데이터를 가져오지 못했습니다.';

const WRONG_PAGE_TITLE = '잘못된 요청';

const WRONG_PAGE_DETAIL = '요청하신 페이지는 존재 하지 않습니다.';

final baseUrl = 'https://def7-106-250-199-244.ngrok-free.app';

//  final baseUrl = 'http://10.20.82.56:8044';

//안드
//  final androidIp = 'http://10.0.2.2:7232/api';
//
// final iOsIp = 'http://127.0.0.1:7232/api';
//
// // final simulatorIp = '127.0.0.1:8031';
// //런타임에 어떤 운영체제에서 사용중인지 알수 있음.
//
//  final baseUrl = Platform.isIOS ? iOsIp : androidIp;
