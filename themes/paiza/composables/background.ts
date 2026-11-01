import type { CSSProperties } from "vue";

// Same contract as Slidev's built-in image layouts: a colour, or an image path resolved against the base URL.
export function backgroundStyle(image: string | undefined, backgroundSize: string): CSSProperties {
  if (!image) return {};
  if (image.startsWith("#") || image.startsWith("rgb")) return { background: image };
  const url = image.startsWith("/") ? import.meta.env.BASE_URL + image.slice(1) : image;
  return {
    backgroundImage: `url("${url}")`,
    backgroundRepeat: "no-repeat",
    backgroundPosition: "center",
    backgroundSize,
    color: "white",
  };
}
