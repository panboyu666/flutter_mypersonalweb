'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "a67abccc380330e43792a0b2a16f0d01",
"version.json": "a1c7cb001637bb529ec12714fd57fb73",
"index.html": "9b6dbe26e6d4fd13a37f3cb0c983c14b",
"/": "9b6dbe26e6d4fd13a37f3cb0c983c14b",
"main.dart.js": "489ad3933aaad998234c74ab333add58",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "105e9aafbb09143c82438da38398252d",
"assets/AssetManifest.json": "687a61fab1807e8f65d2837f8d055bf6",
"assets/NOTICES": "f9e503f6df965e18d175eb984b9214d7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d8fdca8d4b981655d8c82cb3310999d8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "26f1c9374ae5b43e81b46951f50fae5d",
"assets/fonts/MaterialIcons-Regular.otf": "4bb933da04dde647278d38657046c766",
"assets/assets/i04.jpg": "2d0a212a273bf15f350d3b710242fb06",
"assets/assets/i05.jpg": "182a7b3ecbd6073f2e32248b6cd0e34b",
"assets/assets/i07.jpg": "1cea741f9e2640156911dc279137f666",
"assets/assets/i02.png": "3f1d752690f487c794e7ac548cdf0db1",
"assets/assets/i03.png": "b9d04f912b5bdd096b6ef3296d220623",
"assets/assets/i01.png": "be54e7de80003c5da95663a76f1ec8aa",
"assets/assets/aa01.png": "cc423b595f3d215b2452026cbe82823a",
"assets/assets/images/01.png": "90539013b815d7d4d6fdd9dde73ec9ba",
"assets/assets/images/03.png": "12eebba56be2c2647ceb8af5203f4f6c",
"assets/assets/images/02.png": "e19c359fefda9ba7b441bfa4e19a9253",
"assets/assets/images/05.png": "246a3c949480fb3d43cc4bb7390bc0df",
"assets/assets/images/ab01.png": "6c325ffbd769015eacbfd15695041fd2",
"assets/assets/images/04.png": "ad6e946eaf92335afb3a5946bb57529f",
"assets/assets/images/your_image.jpg": "055752cc452460d4c0cf4536b414c315",
"assets/assets/images/48284.jpg": "df82c5864ae6d0cb0e4cba2564c88d1c",
"assets/assets/images/x06.png": "394d6bb7b6548456f76df8e44cc434c2",
"assets/assets/images/4.png": "4c3a226389b8e3790ecbbdf7baa70691",
"assets/assets/images/5.png": "4bb32497d7a958f3261480f41a708aea",
"assets/assets/images/x05.png": "13b4da8435f2d1e7d9b3243e905a85d2",
"assets/assets/images/x04.png": "76d602cd213beed90dc83fdb200905fd",
"assets/assets/images/2.png": "6f88cf2fcdd85e1c8b643d8a0e97d1b1",
"assets/assets/images/3.png": "88dab26cb6a93520ccd43213781bc519",
"assets/assets/images/x01.png": "e00fa9b0d9b3fea35815e6b3e2c4d2be",
"assets/assets/images/x03.png": "36a971ff64a187abea80e4645fb2bb61",
"assets/assets/images/1.png": "4d4908cf9bc23332e3279325a412c2d2",
"assets/assets/images/x02.png": "71758420d06a3448a3075eb6fd3da627",
"assets/assets/ab01.png": "6c325ffbd769015eacbfd15695041fd2",
"assets/assets/avatar.jpg": "055752cc452460d4c0cf4536b414c315",
"assets/assets/atr.png": "88c69eb75d86fb3cc6b63d7c5e35a460",
"assets/assets/48284.jpg": "df82c5864ae6d0cb0e4cba2564c88d1c",
"assets/assets/a01.jpg": "46b4309e082414b095d23bad0a6272a7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
