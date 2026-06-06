import cv2
import os
from pathlib import Path
import pandas as pd


def get_video_metadata(video_path):
    """
    Extract resolution, FPS, and frame count from an MP4 file.
    
    Args:
        video_path (str): Path to the video file
    
    Returns:
        dict: Dictionary containing width, height, fps, and frame_count
    """
    try:
        cap = cv2.VideoCapture(video_path)
        
        # Extract video properties
        width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
        height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
        fps = cap.get(cv2.CAP_PROP_FPS)
        frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
        
        cap.release()
        
        return {
            'width': width,
            'height': height,
            'fps': fps,
            'frame_count': frame_count,
            'resolution': f'{width}x{height}'
        }
    except Exception as e:
        return {
            'width': None,
            'height': None,
            'fps': None,
            'frame_count': None,
            'resolution': 'Error',
            'error': str(e)
        }


if __name__ == '__main__':
    # Define directories
    input_videos_dir = Path('input-videos/ready/')
    
    # Find all MP4 files
    video_files = []
    
    for directory in [input_videos_dir]:
        if directory.exists():
            mp4_files = list(directory.glob('*.mp4')) + list(directory.glob('*.MP4'))
            video_files.extend(mp4_files)
            print(f"Found {len(mp4_files)} MP4 files in {directory.name}/")
        else:
            print(f"Warning: Directory not found: {directory}")
    
    print(f"\nTotal MP4 files found: {len(video_files)}")
    
    # Extract metadata for each video file
    metadata_list = []
    
    for video_file in sorted(video_files):
        print(f"Processing: {video_file.name}...", end=' ')
        
        metadata = get_video_metadata(str(video_file))
        metadata['filename'] = video_file.name
        metadata['directory'] = video_file.parent.name
        metadata['path'] = str(video_file)
        
        metadata_list.append(metadata)
        
        if metadata.get('error'):
            print(f"ERROR: {metadata['error']}")
        else:
            print(f"{metadata['resolution']} @ {metadata['fps']} fps")
    
    print(f"\nProcessed {len(metadata_list)} files")
    
    # Create DataFrame
    df = pd.DataFrame(metadata_list)
    
    # Select and reorder columns for display
    display_columns = ['directory', 'filename', 'resolution', 'width', 'height', 'fps', 'frame_count']
    df_display = df[display_columns].copy()
    
    # Rename columns for clarity
    df_display.columns = ['Directory', 'Filename', 'Resolution', 'Width', 'Height', 'FPS', 'Frame Count']
    
    # Display the table
    print("\n" + "="*110)
    print("VIDEO METADATA SUMMARY")
    print("="*110)
    print(df_display.to_string(index=False))
    print("="*110)
    
    # Summary statistics
    print(f"\nTotal files: {len(df)}")
    print(f"\nResolutions found:")
    print(df['resolution'].value_counts())
    print(f"\nFPS values found:")
    print(df['fps'].value_counts())
