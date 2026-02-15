# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes to install.
# Unknown-registry custom nodes were present but none provided an aux_id (GitHub repo) so they could not be resolved and were skipped:
# - MarkdownNote (unknown_registry) (no aux_id)
# - MarkdownNote (unknown_registry) (no aux_id)

# download models into comfyui
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.2-klein-9b-fp8/resolve/main/flux-2-klein-9b-fp8.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b-fp8.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein-9B/resolve/main/split_files/text_encoders/qwen_3_8b_fp8mixed.safetensors --relative-path models/text_encoders --filename qwen_3_8b_fp8mixed.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-klein-9B/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
