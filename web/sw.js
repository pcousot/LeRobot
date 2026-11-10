// sw.js -- makes the page "cross-origin isolated" on a server that cannot
// send the needed headers (GitHub Pages): SharedArrayBuffer, which lets the
// robot wait for a key, needs the headers Cross-Origin-Opener-Policy and
// Cross-Origin-Embedder-Policy. This service worker adds them to the files
// of the site.
self.addEventListener("install", () => self.skipWaiting());
self.addEventListener("activate", (e) => e.waitUntil(self.clients.claim()));
self.addEventListener("fetch", (e) => {
  const r = e.request;
  if (r.cache === "only-if-cached" && r.mode !== "same-origin") return;
  if (new URL(r.url).origin !== self.location.origin) return;
  e.respondWith(fetch(r).then((rep) => {
    if (rep.status === 0) return rep;
    const h = new Headers(rep.headers);
    h.set("Cross-Origin-Opener-Policy", "same-origin");
    h.set("Cross-Origin-Embedder-Policy", "require-corp");
    h.set("Cross-Origin-Resource-Policy", "same-origin");
    return new Response(rep.body, { status: rep.status, statusText: rep.statusText, headers: h });
  }));
});
