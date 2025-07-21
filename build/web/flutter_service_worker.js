'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b534644f340b02e8279b70ceaaf4a0d5",
"assets/AssetManifest.bin.json": "9df45b12a6042c1ec125199b75b846d7",
"assets/AssetManifest.json": "bccd6cf449f9b621a958125c97b2c0f7",
"assets/assets/fonts/CourierPrime-Regular.ttf": "fba4686ed1d1b4ef05ab14db78805dbe",
"assets/assets/images/91.jpg": "8d373481b7280c71097226e3b3d7bc18",
"assets/assets/images/92.jpg": "3860ea315a8bcf5dcf9b53d50eec8b20",
"assets/assets/images/93.jpg": "769ac069ef515c8cfea4a984164776c3",
"assets/assets/images/a1.jpg": "8fb0d6e08490fe2f8accd705d2804db0",
"assets/assets/images/a2.jpg": "1344ac01bad87a6d2fd8e3f32bc550bd",
"assets/assets/images/a3.jpg": "68486ec9727f014a9b051bd8423116b9",
"assets/assets/images/b2.jpg": "6936f628e2e8581a210a926e5cee4d1c",
"assets/assets/images/b3.jpg": "4a52f5dfc25d3b2e43f02abb2e2b9001",
"assets/assets/images/fc1.jpg": "0c3b26781c18b75409c63f65111968e7",
"assets/assets/images/fc2.jpg": "6a1e3600f88bd64ea5a2e120bbd422a3",
"assets/assets/images/fc3.jpg": "08697d80b30311e7fda8fa120cefc4fe",
"assets/assets/images/l1.jpg": "bbe31b6bca2d36df6e7cce089fed1118",
"assets/assets/images/l2.jpg": "0f0a37f4bd4d62ad7c1a3d00de587e0b",
"assets/assets/images/l3.jpg": "0fdcf82f57bd0c05d1b527f6556f9423",
"assets/assets/images/n1.jpg": "4353b021a854a21286ce18dbfd3890eb",
"assets/assets/images/n2.jpg": "12cb0b14b25110afbf52104dfc2444d1",
"assets/assets/images/n3.jpg": "3593cc1f9031b93943e586e7b408e133",
"assets/assets/images/ne1.jpg": "62dba4ca682a76c46031c0a9b7f8093c",
"assets/assets/images/ne2.jpg": "55d90c7db23f6d367f69045cc26cea0b",
"assets/assets/images/ne3.jpg": "9c285101d4ddc9957ba7bd903d29a607",
"assets/assets/images/pic.jpg": "c2120d0d6fa68058b47182b3e72ee431",
"assets/assets/images/w1.jpg": "8645f49817d1f93eed26d2cf9062d88d",
"assets/assets/images/w2.jpg": "5bd2cb5849b444ae6aa13b3755c5f4e8",
"assets/assets/images/z1.jpg": "c7e86aa9f938b363471345e46f961cd3",
"assets/assets/images/z2.jpg": "56f483b6e296e066fb5f9b86634152c2",
"assets/assets/images/z3.jpg": "e72c0be14fb080db6f55bd41dc587f9e",
"assets/FontManifest.json": "0a8a708f15490766ee13c68ab3e76d06",
"assets/fonts/MaterialIcons-Regular.otf": "1467f8df93733a9b6bd3e358587941dc",
"assets/NOTICES": "1ad819230cd9a329fcf3d0ca2797abef",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "ccd595d1edeaa13b213d3c7c08843726",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0cb978b60cc22115945bf881dd7c9798",
"/": "0cb978b60cc22115945bf881dd7c9798",
"main.dart.js": "26237c5c5bd9fe8eb447600047dfe5ab",
"manifest.json": "f71ed11680aee29408c733a45b22a52f",
"version.json": "037f64bb1337bd6fb8963a52ee919e8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
