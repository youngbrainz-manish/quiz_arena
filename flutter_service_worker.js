'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "205f775c5ad943d3bbfae47a2cb3264d",
"version.json": "3d76919590f5f03ee91dd91a2241916e",
"splash/img/light-2x.png": "6be402dd968cf4623720ecdac833ec5b",
"splash/img/dark-4x.png": "03ca65224b3fae037db7be185656bb46",
"splash/img/light-3x.png": "e34f0d8f4f685270d1dbb0f65ababac6",
"splash/img/dark-3x.png": "e34f0d8f4f685270d1dbb0f65ababac6",
"splash/img/light-4x.png": "03ca65224b3fae037db7be185656bb46",
"splash/img/dark-2x.png": "6be402dd968cf4623720ecdac833ec5b",
"splash/img/dark-1x.png": "5fe0fad7bf7edb04c01ac886fb851e52",
"splash/img/light-1x.png": "5fe0fad7bf7edb04c01ac886fb851e52",
"index.html": "87891e3dd1948fc6cdf0136fba2022b6",
"/": "87891e3dd1948fc6cdf0136fba2022b6",
"main.dart.js": "b15392eff9cb0b227f4a50ba8a876e1c",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "d0d530c0bc8158e0db3e06b161f5e138",
"icons/Icon-192.png": "acee461ee11910a5f7bda6c5a3cd95f2",
"icons/Icon-maskable-192.png": "acee461ee11910a5f7bda6c5a3cd95f2",
"icons/Icon-maskable-512.png": "80dc3e0cdb6203d7a3f050c328dc8738",
"icons/Icon-512.png": "80dc3e0cdb6203d7a3f050c328dc8738",
"manifest.json": "e69ff879eb378b6a90f8bb3c79cb2bd4",
".git/config": "50fc200b602cf5cd777ed60a0a2f4386",
".git/objects/59/8f47930ec6c1b66c35f86a24cdef710ce45c10": "fe438c9f6ea1c076338d448d0b31507f",
".git/objects/59/c41b6bbb2ba11095793d31e8cb10c6671b49cf": "68bd0920c03eafd13d627b9765442b95",
".git/objects/6f/d5cdafe9913f24808f9c6e95edb569ee0c4461": "a31f2545f329033c09303b8a94b05c30",
".git/objects/03/eaddffb9c0e55fb7b5f9b378d9134d8d75dd37": "e105e618ebe72cd32bb8ffbede8c4bf6",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "7fef652fbe034911f76c4da9e817e225",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "5f22e4867814a2022aa2a916bbf3efef",
".git/objects/69/dd618354fa4dade8a26e0fd18f5e87dd079236": "c04d0bcbee109da1b68573e9237d1b84",
".git/objects/5a/964ec49fe60e672cf18d77b57db2383a617732": "c4b544a8afa795cc6204e51155f9d436",
".git/objects/02/304758d872a805783ce13ac67f9ee0e7aa5cc4": "6fa4f182d855885d4a73485c64cefdd5",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "1a4ee0c85a695a5f8ce1f75dac7efc0c",
".git/objects/da/c5962791e6fe1d767e5b0d9599e6a547eb198c": "4a054c780edfd50b3d5c2c5583fada4d",
".git/objects/da/0d5aa44a8c93eda469f7a99ed8feac32d5b19d": "f06d3f21945ea72565c84c740cbd7fd8",
".git/objects/d1/392578ee58a068850c66a59014e48fcefa1a7c": "b584ab35ca15b2035d253d837ded2ceb",
".git/objects/d8/8128adaad90d2fd7cdabe7b36eaaaed0d3a25b": "c887a57ff0eafa2df6b6f3fb5d630526",
".git/objects/e2/4ec06cf5b422c75734e7a15325b8ba6f340105": "a248e9f64c1f7969379bf0718de7ea8f",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "aa30b45014e5ab878c26ecce9ea89743",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "fb2ee964a7fc17b8cba79171cb799fa3",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "b8a36c8cfabd566efa7afcbb37489693",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "8758ec0601c68cfa14e5aa0bd1db956b",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "9c41d2761da53894e11f717877b1707a",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "1eaf6fbe076294c3f0daf90d55e4254a",
".git/objects/27/78c5a5382581a9cd9c2a30f35cffccf00dfe08": "f88444b47008f196aba0873b5b4549ab",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "fea60a4487346b57a5566c176c3edf3d",
".git/objects/42/c5318ccb8f82c4851cf0f44488f4f70523a65d": "038ece1220b9722f3a80a727163614b5",
".git/objects/8f/e7af5a3e840b75b70e59c3ffda1b58e84a5a1c": "6db9ef87f25d1bcf0e7bea48b7fdf817",
".git/objects/8f/ac63a7da9f77f3577a63340e198a479ab81025": "1d77141cb5106a1714bd422189b7b91f",
".git/objects/4c/b8d0d87c218cd4a29e26cef64970f807f07e7c": "a323c270cb8d828afd0e9a963e322fca",
".git/objects/26/fb7e9fd208061be23fa1f20bbc4937ab8942b7": "81aade0ec9fc78ea6c7e35cc6f418ac0",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "889bc03fb6a15e508732478b9100196e",
".git/objects/75/ac03db9b3097e15f150edbcd20c9b7721a0fc0": "1698ab1a3d57dea4ecc4a7c24201df12",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "9524d053d0586a5f9416552b0602a196",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "673571ee0bcce7e10d7ca6c90f04f5d6",
".git/objects/5b/d3b5d80edc893328cf919dbfb7c6ac5dbd632f": "917a5f03cc4b8167cccec52846c75954",
".git/objects/06/6789c07130a1f58d9eea70649bac0e4111ed89": "081c7bfdd3b8d8c18425e44a91b15bb7",
".git/objects/39/cfa58adaa76668a328b43dd6fa7d4f7d3d013b": "4dbbfd97c4aef7ed56013780681f6068",
".git/objects/99/9050dc19b18c4f966c0ef86d8fb69273f3cac1": "e5e8563a6dba3ffb30cc7cc628395811",
".git/objects/d3/fe244b975de5b48e519e74561b6649e935103d": "ca3480d6eed02fc9b46b45e97f2fc994",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "9dbf5b01e391c548c8343be8d1d4b04e",
".git/objects/dd/51abccaca9fe3a0efcf092d4fa05599b1a489b": "227ffeac62e17eda7b0edeb863a1e0ec",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b11768e6a8ca60bad07211a36372d59f",
".git/objects/b9/f80f7b32783891d7f7df79cdca8472bc27f0d6": "3d2ece494b7a10fff1670f1506a92415",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "34d9bb262a1db8360a1db06f4cea5edc",
".git/objects/ff/9a3223e2db9e982c30eb5aa14ae89ae1c07320": "aed9ea4e15ef56059eb1ed6440287945",
".git/objects/c5/57488119297a71bf579aa1416f7b507923cd5e": "2627b30ffb817f08369f6b79a65ec54a",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "c3694958e54483a81b3e32ab9f84ece2",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "0bb82caa96c962530864f28e847f4ab9",
".git/objects/24/c8baa147b1ea15361c66c415c2522f5f4b0396": "87b7d4e52b7c719b4918e0748f7fb060",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "cfcbae98ed59ea0e225d141b40bcf512",
".git/objects/8c/582e9b2560d7f61f4c85bb9a1b79d24ad1258f": "e1f9e69b2782d7d3710a2909a80bf107",
".git/objects/1c/eece6385aaa2b476e4db4a7d375b15f5da8a17": "8594f91c14f03a12fd062b42555c0559",
".git/objects/82/21f7cafffc2c87163f400cecc4090229b31e46": "7f171c9cef7f4e21913c91433fb3a6c1",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "2e52b2703dcf92f5b2f87b4661347cc3",
".git/objects/7a/e794c94cdfadc09c2218b679ff21e6f171f8b9": "a5f402157eb83afbdd40353f7005be46",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e4140d92c25728de52de120f8bea356a",
".git/logs/refs/heads/gh-pages": "e4140d92c25728de52de120f8bea356a",
".git/logs/refs/remotes/origin/gh-pages": "0431085c1114f55d687cbc0502315ef2",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "60d2a1a18c4ebaf734800e14a41bb58d",
".git/refs/remotes/origin/gh-pages": "60d2a1a18c4ebaf734800e14a41bb58d",
".git/index": "45bfb270ab3b39b015ac541204c4b259",
".git/COMMIT_EDITMSG": "daf53f5082d2ca04bae22b020936b443",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/NOTICES": "1410bc47600f7329e636a84f71c13dca",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "69a99f98c8b1fb8111c5fb961769fcd8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "693635b5258fe5f1cda720cf224f158c",
"assets/fonts/MaterialIcons-Regular.otf": "e378dad2c53a897015a173623294a10c",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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
