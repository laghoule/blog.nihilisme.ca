###############
# Build Stage #
###############
FROM hugomods/hugo:exts AS builder

ARG HUGO_BASEURL=https://blog.nihilisme.ca/
ENV HUGO_BASEURL=${HUGO_BASEURL}
COPY . /src
RUN hugo --minify --gc --enableGitInfo
# Set the fallback 404 page if defaultContentLanguageInSubdir is enabled, please replace the `en` with your default language code.
# RUN cp ./public/en/404.html ./public/404.html

###############
# Final Stage #
###############
FROM hugomods/hugo:nginx
COPY --from=builder /src/public /site

EXPOSE 80