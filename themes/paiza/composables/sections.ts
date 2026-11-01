import { useNav } from "@slidev/client";
import { computed } from "vue";

export type Section = {
  no: number;
  number: string | undefined;
  title: string;
  speaker: string | undefined;
};

const pad = (value: unknown) => String(value).padStart(2, "0");

// Every `layout: section` slide, in order. Drives section numbers, the toc and the header label.
export function useSections() {
  const { slides } = useNav();

  return computed<Section[]>(() =>
    slides.value
      .filter((route) => route.meta?.slide?.frontmatter.layout === "section")
      .map((route, index) => {
        const frontmatter = route.meta.slide.frontmatter;
        return {
          no: route.no,
          number: frontmatter.number === false ? undefined : pad(frontmatter.number ?? index + 1),
          title: route.meta.slide.title ?? frontmatter.title ?? "",
          speaker: frontmatter.speaker,
        };
      }),
  );
}
